


Compiling your program using OpenMPI
------------------------------------

To compile a program using OpenMPI you should load the openmpi module you want to use e.g.::

  module add openmpi/3.0-gcc-6.2

You can then use the following commands to compile C, C++, and Fortran programs respectively::

  mpicc
  mpiCC
  mpif90


Running OpenMPI-built programs using SLURM
------------------------------------------

Sample job script (jobscript.sh):


.. literalinclude:: files/jobscript.sh
  :language: bash

would then submit the job using e.g.::

  sbatch ./jobscript.sh 
