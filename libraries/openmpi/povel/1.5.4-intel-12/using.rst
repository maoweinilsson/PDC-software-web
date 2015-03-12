


Compiling your program using OpenMPI
------------------------------------

To compile a program using OpenMPI you should first load the compiler module
then load the openmpi module you want to use e.g.::

  module add i-compilers/12.1.5
  module add openmpi/1.5.4-intel-12

You can then use the following commands to compile C, C++, and Fortran programs respectively::

  mpicc
  mpiCC
  mpif90


Running OpenMPI-built programs using EASY
-----------------------------------------

Sample job script (jobscript.sh):

.. code:: bash

  #!/bin/bash
  module add openmpi/1.5.4-intel-12
  processes_per_node=8
  total_processes=`expr $processes_per_node \* $SP_PROCS`
  PRG="$1"
  shift
  ARGS="$*"
  mpirun -np $total_processes -machinefile $SP_HOSTFILE $PRG $ARGS

where ``processes_per_node`` should be set for 8 for Ferlin and 24 for Povel.

You would then submit the job using e.g.::

  esubmit -n3 -t15 ./jobscript.sh Program_to_run option1 option2
