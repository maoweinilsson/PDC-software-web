


Example input: Structure optimization of benzene with B3LYP functional
----------------------------------------------------------------------

To give an explicit example we will optimize the structure of benzene using the B3LYP functional with the following input file (we call it benzene.com):

.. literalinclude:: files/benzene.com

Please note that there is one blank line at the end of the input. If you forget
this blank line you will see an error termination with the error::

  End of file in ZSymb.


Parallelization using OpenMP
----------------------------

At PDC we do not hold a license for Linda parallelization of Gaussian, so only
single node jobs can be run. Intra-node parallelism is achieved using OpenMP
and by default is over 8 cores. The number of cores that are used by Gaussian
can be changed using the %NProcShared Link 0 command.


Submitting the job
------------------

To submit a Gaussian job we use the following run script (we call it gaussian.run):

.. literalinclude:: files/gaussian.run
    :language: bash

This script needs to be executable::

  $ chmod 700 gaussian.run

Having the input file (benzene.com) and the run script (gaussian.run), we are ready to submit the job::

  $ module add easy
  $ esubmit -n 1 -t 10 ./gaussian.run benzene.com

This calculation only takes two minutes (but we ask for 10). A successful
calculation will terminate with a line that looks like this one::

  Normal termination of Gaussian 09 at Fri Dec 13 15:39:26 2013.
  Changing the scratch directory

On Povel you may want to specify /cfs/klemming/scratch as scratch space for the
calculation. For this change GAUSS_SCRDIR in your run script::

  export GAUSS_SCRDIR=/cfs/klemming/scratch/${USER:0:1}/${USER}/scratch_gaussian
