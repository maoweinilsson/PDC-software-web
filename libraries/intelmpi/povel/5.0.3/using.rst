

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

  mpiifort
  mpiicc

to compile and link your MPI programs.

Using gcc
---------

Intel MPI also has wrappers that automatically use gcc::

  mpigcc
  mpif90

If the compiler is invoked using these commands then the version of
gcc or gfortran in your $PATH is automatically used to compile Other
wrappers

As well as the compiler specific wrappers you can also use::

  mpicc -cc=<compiler>
  mpifc -f90=<compiler>

Note the PGI compiler is not supported

Running Intel MPI programs using EASY
=====================================

Preparation - once in your home catalog
---------------------------------------

Your home directory is available on all PDC clusters from an OpenAFS
volume. You can create there a configuration file that will be used
for authentication within the MPI library. This is an optinal step for
Intel MPI. However, because it can be used for MPICH and MVAPICH too,
it is recommended to create this file. That makes it more convenient
to change between different MPI libraries later.::

  echo "secretword=<arbitrary-word>" >~/.mpd.conf
  chmod 600 ~/.mpd.conf

N.B. Do not use a word that you use somewhere else as password.


Repeatedly in interactive sessions and job scripts
--------------------------------------------------

To run appliations with Intel MPI you need to start the mpd daemons on
the compute nodes before the application can run. These daemons should
be stopped again if you stop using MPI programs. The next sections
shows an example of a jobscript that can be used with Intel MPI on
clusters with the batch system EASY.

.. code:: bash
  
  #!/bin/bash 

  # Load the appropriate module of the batch system, t.ex.
  module load easy

  #Start the mpd daemons: one on every compute node
  NR_NODES=$(cat ${SP_HOSTFILE} | wc -l)
  mpdboot -n ${NR_NODES} -f ${SP_HOSTFILE}

  # Now start the MPI application
  mpiexec -n <desired-number-of-mpi-processes> ./my_mpi_prog_1
  # Maybe use another MPI program
  mpiexec -n <desired-number-of-mpi-processes> ./my_mpi_prog_2

  # Done with MPI. Shutdown the mpd daemons.
  mpdallexit

The same commands can also be used in interactive jobs. But, before
issuing the commands listed above, please do the following
preparation.

#. Determine the nodes that belong to your job. You will get an e-mail that lists the assigned compute nodes or you can use the command spusage for that.
#. Login to the first node in the list.
#. Make the environment definitions of the batch job available to your terminal session::

            $ module load easy
            spattach -j <the-number-of-your-job>

Your terminal session uses after this preparation the same environment
like a batch job would do. You can now execute your job script
manually or issue the commands one by one.


