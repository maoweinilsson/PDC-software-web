:orphan:


.. include:: running.inc


Example job script
------------------

::

  #!/bin/bash

  # we load gamess
  module add gamess/2013-05-01-R1

  # we load the modules that we need
  module add i-compilers intelmpi mkl

  NR_NODES=$(cat ${SP_HOSTFILE} | wc -l)

  PROCS_PER_NODE=24
  MPI_PROCS=$[NR_NODES*$PROCS_PER_NODE]

  # this env variable is used in gamess
  export NNODES=$NR_NODES

  # IMPORTANT - read this:
  # create scratch directory
  # the default scratch directory is /scratch/$USER/gamess
  # but the user can override it by setting CUSTOM_GAMESS_SCRATCH
  # NEVER point CUSTOM_GAMESS_SCRATCH to your home directory
  # since the program might erase the scratch space after the calculation
  # terminates
  export CUSTOM_GAMESS_SCRATCH=/cfs/klemming/scratch/${USER:0:1}/${USER}/gamess_scratch/$SP_JID

  # now start gamess
  rungms exam01.inp 01 $MPI_PROCS $PROCS_PER_NODE
