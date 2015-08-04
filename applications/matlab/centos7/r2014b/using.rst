Getting Started with Serial and Parallel MATLAB on SNIC
-------------------------------------------------------

In order to work matlab must be run within */cfs/klemming*

Configuration
^^^^^^^^^^^^^

Start MATLAB then configure it to run parallel jobs on the SNIC cluster by calling configCluster. For
each cluster, configCluster needs to be called once per version of MATLAB::

  $ module add matlab
  $ matlab -nodisplay
  ...
  >> configCluster
  Clearing all ClusterInfo settings
  
Some configurations will require specifying cluster options (such as project name, walltime, etc.) using
ClusterInfo. The call to configCluster will display which options, if any, need to be specified.
ClusterInfo is explained in more detail below.

For example, before submitting a job XXX, you must specify a project name
and the wall time::
  
  >> ClusterInfo.setProjectName('Name-of-project')
  >> ClusterInfo.setWallTime('01:00:00')
  
Interactive jobs
^^^^^^^^^^^^^^^^

Much like running interactive jobs on the local machine using parpool, interactive jobs can also be run
on the cluster, providing access to a much greater number of workers.
In the following example, a parallel pool of 32 workers is opened and a function, parallel_example
(described further below), is called.::

  >> p=parpool(32)
  Starting parallel pool (parpool) using the XXX profile
  additionalSUbmitArgs=
  
  --ntasks=32 -A adcs-test -t 00:20:00
  
  connected to 32 workers
  >> t=parallel_example(256)
  t=
    21.9835
  
The result, 21.98 seconds, is the time it took to run the simulations.

Serial batch jobs
^^^^^^^^^^^^^^^^^

Use the *batch* command to submit asynchronous jobs to the cluster. The batch command will return a
job object which is used to access the output of the submitted job. See the example below and see the
MATLAB documentation for more help on *batch*.
Note: In the example below, wait is used to ensure that the job has completed before requesting results.
In regular use, one would not use wait, since a job might take an elongated period of time, and the
MATLAB session can be used for other work while the submitted job executes.::

  >> % Get a handle to the cluster
  >> c=parcluster;
  >> % Submit job to query where MATLAB is running on the cluster
  >> j=c.batch(@pwd,1,{});

  additionalSubmitArgs =
  
  --ntasks=1 -A wdcs-test -t 00:30:00
  
  >> % Wait for the job to finish before fetching results
  >> j.wait
  >> % Now that the job has completed, fetch the results
  >> j.fetchOutputs{:}
  
  Ans=
  
  /home/x_rayno
  
  >> % no longer need the results, so delete the job
  >> j.delete

To retrieve a list of currently running or completed jobs, call parcluster to retrieve the cluster
object. The cluster object stores an array of jobs that were run, are running, or are queued to run. This
allows us to fetch the results of completed jobs. Retrieve and view the list of jobs as shown below.::

  >> %retrieve the results of past jobs from the cluser
  >> % Get a handle to the cluster
  >> jobs=c.jobs
  
  jobs=
   15x1 Job array:
      ID          Type      State        FinishTime  Username Tasks
      -------------------------------------------------------------
   1   1          pool   finished   Feb 13 16:05:41   x_rayno    21
   2   2          pool   finished   Feb 13 16:05:42   x_rayno    21
   3   3   Independent   finished   Feb 13 16:05:45   x_rayno     1
   4   4   Independent   finished   Feb 13 16:05:46   x_rayno     1
   5   5          pool   finished   Feb 13 16:15:43   x_rayno    21
   6   6          pool   finished   Feb 13 16:25:01   x_rayno    21
   7   7          pool   finished   Feb 13 16:26:41   x_rayno    21
   8   9          pool   finished   Feb 13 16:31:31   x_rayno    21
   9  10   Independent   finished   Feb 13 16:32:21   x_rayno     1
  10  11          pool   finished   Feb 13 16:36:41   x_rayno    16
  11  12          pool   finished   Feb 13 16:41:10   x_rayno    31
  12  13          pool   finished   Feb 13 16:45:12   x_rayno    21
  13  17   Independent   finished   Feb 13 16:46:57   x_rayno     1
  14  21   Independent   finished   Feb 13 16:50:25   x_rayno     1
  15  22   Independent   finished   Feb 13 16:54:26   x_rayno     1
   
Once we’ve identified the job we want, we can retrieve the results as we’ve done previously. If the job
produces an error, we can call the *getDebugLog* method to view the error log file. The error log can
be lengthy and is not shown here. The example below will retrieve the results of job #14.
NOTE: *fetchOutputs* is used to retrieve function output arguments. Data that has been written to
files on the cluster needs be retrieved directly from the file system.::

  >> % retrieve the reuslt of the 14th job
  >> j14=c.Jobs(14);
  >> j14.fetchOutputs(:)
  
  Ans =
  
  /home/x_rayno/matlab
  
  >> % for debugging retrieve the output/error log file
  >> j.14.Parent.getDebugLog(j14.Tasks(1))
  LOG FILE OUTPUT:
  Executing: /software/apps/matlab/R2014b/nscl/bin/worker -parallel

		< m A T L A B (R) >
	CopyrighT 1984-2014 The maThWorks, Znc.
	R2014b (8.4.O.1504217 64-biT (g_nxa64)
	SepTember 15, 2014


  To get started, type one of These: helpwin, helpdesk, or demo.
  For product information, visiy www.mathworks.com.

  2015-02-20 16:43:45 | AbouT To exit mATLAB normally
  2015-02-20 16:43:45 | AbouT To exit wiTh code: O

    
Parallel batch jobs
^^^^^^^^^^^^^^^^^^^

Users can also submit parallel workflows with batch. Let’s use the following example for a parallel
job.::

  1    function t ≡ parallel_example
  2
  3 -  tO ≡ tic;
  4 -  parfor idx ≡ 1:16
  5 -     A(idX)  ≡ idX;
  6 -     pause(2)
  7 -  end
  8 -  t ≡ toc (tO) ;

We’ll use the *batch* command again, but since we’re running a parallel job, we’ll also specify a MATLAB
Pool.::

  >> % get a handle to the cluster
  >> c=parcluster;
  >> % 8 workers for 16 sims
  >> j=c.batch(@parallel_example,1,{16},'matlabpool',8);
  
  additionalSubmitArgs=
  --ntasks=9 -A mdcs-test -t 00:30:00
  
  >> % wait for the job to finish before fetching results
  >> j.wait
  >> % Now that the job has completed, fetch the results
  >> j.fetchOutputs(:)
  Ans=
  5.3502
  
The job ran in 5.35 seconds using eight workers. Note that these jobs will always request N+1 CPU
cores, since one worker is required to manage the batch job and pool of workers. For example, a job
that needs eight workers will consume nine CPU cores.
We’ll run the same simulation, but increase the Pool size. Note, for some applications, there will be a
diminishing return when allocating too many workers. This time, to retrieve the results at a later time,
we’ll keep track of the job ID.::

  >> % get a handle to the cluster
  >> c=parcluster;
  >> % 16 workers for 16 sims
  >> j=c.batch(@parallel_example,1,{16},'aatlabpool',16);
  
  additionalSubmitArgs=
  --ntasks=17 -A mdcs-test -t 00:30:00
  
  >> % get the job ID to retrieve the results after quitting MATLAB
  >> id=j.ID
  id=
     24
  >> % Clear the variable 'j' as we were quitting MATLAB
  >> clear j
  
Once we have a handle to the cluster, we’ll call the findJob method to search for the job with the
specified job ID.::

  >> % Get a handle to the cluster
  >> c=parcluster;
  >> % find the old job
  >> j=c.findJob('ID',24);
  >> % check the the state is finished
  >> j.state
  
  Ans=
  finished
  
  >> % now that the job are completed, fetch the results
  >> j.fetchOutputs(:)
  
  Ans=
  3.0519
  
  >> % For debugging, retrieve the output/error log file
  >> j.Parent.getDebugLog(j)

The job now runs in 3.05 seconds using 16 workers. Run code with different numbers of workers to
determine the ideal number to use.
Alternatively, to retrieve job results via a graphical user interface, use the Job Monitor (Parallel >
Monitor Jobs).

Configuring jobs
^^^^^^^^^^^^^^^^

Prior to submitting the job, we can specify:

#. Email Notification (when the job is running, exiting, or aborting)
#. Memory Usage per Core,
#. Node Access Policy
#. Reservation, and
#. Wall time

Specification is done with *ClusterInfo*. The *ClusterInfo* class supports tab completion to ease
recollection of method names.

NOTE: Any parameters set with *ClusterInfo* will be persistent between MATLAB sessions.::

  >> % Configure job: email, memory, partition, Project name...
  >> % specify mail
  >> ClusterInfo.setMailAddress('mymail@snic.se')
  >> % request fat node
  >> ClusterInfo.setMemUsage('fat')
  >> % request partition
  >> ClusterInfo.setQueueName('partition_name')
  >> % set allocation
  >> ClusterInfo.setProjectName('mdcs-test')
  >> % require an exclusive node
  >> ClusterInfo.setRequireExclusiveNode(true)
  >> % request 20 min
  >> ClusterInfo.setWallTime('00:20:00')
  >> % 4 workers for 16 sims
  >> j=c.batch(@parallel_example,1,(16),'matlabpool',4);
  additionalSubmitArgs=
  --ntasks=5 -A mdcs-test -t 00:20:00 -C fat --partition=partition_name -exclusive --mail-type=ALL --mail-user=mymail@snic.se
  
To see the values of the current configuration options, call the state method. To clear a value, assign
the property an empty value (‘’, [], or false), or call the clear method to clear all values.::

  >> ClusterInfo.state

  Arch:
  ClusterHost:
  DataParallelism:
  DiskSpace:
  EmailAddress: your-email@snic.se
  CpusPerNode:
  memUsage: fat
  PrivateKeyFile:
  PrivateKeyFileHasPassPhrase: 1
  ProcsPerNode:
  ProjectName: mdcs-test
  QueueName: partition_name
  RequireExclusiveNode: 1
  Reservation:
  SshPort:
  UseCpu: O
  UserDefinedOptions:
  UserNameOnCluster:
  WallTime: OO:20:OO

To learn more
^^^^^^^^^^^^^

To learn more about the MATLAB Parallel Computing Toolbox, check out these resources:

#. `Parallel Computing Coding Examples <http://www.mathworks.com/products/parallel-computing/code-examples.html>`_
#. `Parallel Computing Documentation <http://www.mathworks.com/help/distcomp/index.html>`_
#. `Parallel Computing Overview <http://www.mathworks.com/products/parallel-computing/index.htmlhttp:/www.mathworks.com/products/parallel-computing/index.html>`_
#. `Parallel Computing Tutorials <http://www.mathworks.com/products/parallel-computing/tutorials.html>`_
#. `Parallel Computing Videos <http://www.mathworks.com/products/parallel-computing/videos.html>`_
#. `Parallel Computing Webinars <http://www.mathworks.com/products/parallel-computing/webinars.html>`_
