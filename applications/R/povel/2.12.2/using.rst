

Instructions for using R at PDC
===============================


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

.. literalinclude:: files/run.pbs
  :language: bash


To use the resulting nodes you need to define a cluster with the getMPIcluster() function. Below is an example script to print the hostname of all MPI tasks.

.. code-block:: bash

  library(parallel)
  library(snow)

  # create a cluster object
  cl <- getMPIcluster()

  clusterEvalQ(cl, Sys.info()['nodename'])

