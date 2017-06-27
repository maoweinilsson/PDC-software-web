Getting Started with Serial and Parallel MATLAB on SNIC
-------------------------------------------------------

In order to work matlab must be run within */cfs/klemming*.  
Load the matlab module by

  $ module add matlab/r2017a
 
  
Running interactively
^^^^^^^^^^^^^^^^^^^^^^^^^

Matlab can be run interactively on an allocated node. To book a 
single node for one hour, type::

  $ salloc -A <your-project> -N 1 --time 1:0:0

A typical output will look like::

  salloc: Granted job allocation 591571
  salloc: Waiting for resource configuration
  salloc: Nodes t02n31 are ready for job

Node t02n31 is now yours for the next hour, and you can log into it and 
start Matlab by (add -X to ssh if you want to run the Matlab GUI)::

  $ ssh <your-username>@t02n31.pdc.kth.se
  t02n31 $ matlab -nodisplay

In the following example, a parallel pool of 24 workers is opened and 
a function, parallel_example (described further below), is called::

  >> p=parpool(24)
  Starting parallel pool (parpool) using the 'local' profile ... conected to 24 workers.


  p = 

  Pool with properties: 

            Connected: true
           NumWorkers: 24
              Cluster: local
        AttachedFiles: {}
          IdleTimeout: 30 minute(s) (30 minutes remaining)
          SpmdEnabled: true

  >> parallel_example
  t =
    2.4711
  ans =
    2.4711


This is how parallel_example.m might look::

  function t = parallel_example
   t0 = tic;
   parfor idx = 1:24
     A(idx) = idx;
     pause(2)
   end
   t = toc(t0)


Running parallel batch jobs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You can also submit parallel workflows to the SLURM queueing system. 
The following job script allocates one node on Tegner and runs one Matlab 
program. If the program contains the parpool() command and parfor loops 
(as demonstrated above), 
Matlab will parallelize the computation over different cores of the node.

.. literalinclude:: files/run_1.sh
  :language: bash

Update the SLURM directives to set your project ID and 
the number of nodes and hours that you wish to allocate,
and save the script as ``run_matlab.sh``.
You can then submit the job with::

  $ sbatch run_matlab.sh

It is advisable to run your code with different numbers of workers to
determine the ideal number to use.
  
Running multiple serial batch jobs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

On Tegner the smallest allocatable computing unit is a whole node. 
Running serial jobs 
is thus an inefficient use of the resources, as all cores except for one will 
be idle on your allocated node. 
If you have several serial Matlab jobs that can be run simultaneously (for 
example, one Matlab program with different input parameters), these can 
be run simultaneously on a booked node.
A simple bash script for submitting multiple Matlab jobs on a single 
Tegner node can look like this:


.. literalinclude:: files/run_manyserial.sh
  :language: bash


Update the SLURM directives to set your project ID and 
the number of nodes and hours that you wish to allocate,
and save the script as ``run_matlab.sh``.
You can then submit the job with::

  $ sbatch run_matlab.sh

To learn more
^^^^^^^^^^^^^

To learn more about the MATLAB Parallel Computing Toolbox, check out these resources:

#. `Parallel Computing Coding Examples <http://www.mathworks.com/products/parallel-computing/code-examples.html>`_
#. `Parallel Computing Documentation <http://www.mathworks.com/help/distcomp/index.html>`_
#. `Parallel Computing Overview <http://www.mathworks.com/products/parallel-computing/index.htmlhttp:/www.mathworks.com/products/parallel-computing/index.html>`_
#. `Parallel Computing Tutorials <http://www.mathworks.com/products/parallel-computing/tutorials.html>`_
#. `Parallel Computing Videos <http://www.mathworks.com/products/parallel-computing/videos.html>`_
#. `Parallel Computing Webinars <http://www.mathworks.com/products/parallel-computing/webinars.html>`_
                                                                                                             
