:orphan:


Instructions for using R at PDC
===============================


R is a language for data analysis and graphics
----------------------------------------------
To see what versions of R are available use the command

.. code-block:: bash

  module avail R

Here is an example job script

.. code-block:: bash

  #!/bin/sh

  module load R/3.0.2

  R < script.r 

Parallel R on several nodes using snow and RMPI
-----------------------------------------------

To run R in parallel on several nodes you need to start R through the command RMPISNOW. Here is an example job script

.. code-block:: bash

  #!/bin/bash

  module load R/3.0.2

  # This is 8 for ferlin, 24 for povel, ...
  CORES_PER_NODE=8

  TOT_CORES=$(($CORES_PER_NODE * $SP_NODES))

  mpirun -np $TOT_CORES --hostfile $SP_HOSTFILE -x PATH -x LD_LIBRARY_PATH RMPISNOW < parallel_script.r


To use the resulting nodes you need to define a cluster with the getMPIcluster() function. Below is an example script to print the hostname of all MPI tasks.

.. code-block:: bash

  library(parallel)
  library(snow)

  # create a cluster object
  cl <- getMPIcluster()

  clusterEvalQ(cl, Sys.info()['nodename'])

