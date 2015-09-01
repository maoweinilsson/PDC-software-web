

Compiling your program using Intel MPI
======================================

Intel MPI has two mpicc/mpif90 type wrapper scripts for automatically
linking the required MPI libraries and header files.  

Using Intel compiler
--------------------

To use the intel compiler with Intel MPI you must have one of the
i-compiler modules and the intel mpi moudule loaded::

  module load i-compilers/15.0.2 intelmpi/5.0.3

Then you can use::

  mpiifort  (FORTRAN)
  mpiicc    (C)
  mpiucpc   (C++)

to compile and link your MPI programs.

Using gcc
---------

Intel MPI also has wrappers that automatically use gcc::

  mpif90    (FORTRAN)
  mpigcc    (C)
  mpicxx    (C++)

If the compiler is invoked using these commands then the version of
gcc or gfortran in your $PATH is automatically used to compile Other
wrappers

As well as the compiler specific wrappers you can also use::

  mpifc  -f90=<compiler>
  mpicc  -cc=<compiler>
  mpicxx -cxx=<compiler>

Note the PGI compiler is not supported

Running Intel MPI programs using SLURM
======================================

IntelMPI has slurm support so it is not necessary to make machinefiles
as it can take the required information from the environment variables set
by SLURM

e.g. running interactively::
  
  salloc --nodes=2 --ntasks-per-node=24
  mpirun -np 48 ./program.x  

similarly using a job script
  
.. literalinclude:: files/intel_mpi.run
    :language: bash

