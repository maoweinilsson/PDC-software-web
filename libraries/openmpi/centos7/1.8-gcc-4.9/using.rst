


Compiling your program using OpenMPI
------------------------------------

To compile a program using OpenMPI you should load the openmpi module you want to use e.g.::

  module add openmpi/1.8-gcc-4.9

You can then use the following commands to compile C, C++, and Fortran programs respectively::

  mpicc
  mpiCC
  mpif90


Running OpenMPI-built programs using SLURM
-----------------------------------------

Sample job script (jobscript.sh):

.. code:: bash

  #!/bin/bash
  openmpi/1.8-gcc-4.9
  total_processes=`echo "24*$SLURM_NNODES" | bc`
  PRG="$1"
  shift
  ARGS="$*"
  mpirun -np $total_processes --host `scontrol show hostnames $SLURM_JOB_NODELIST | tr '\n' ','` $PRG $ARGS

would then submit the job using e.g.::

 sbatch --nodes=1 --ntasks-per-node=24  -t 00:30:00 ./jobscript.sh Program_to_run option1 option2 
