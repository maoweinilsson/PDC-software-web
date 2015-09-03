GROMACS is highly tuned for quite efficient use of HPC resources. Special assembly kernels make its core compute engine one of the fastest MD simulation programs.

Compute nodes, which have Haswell CPUs, can support AVX2 instructions, and deliver approximately 40% speed-up over the standard AVX instruction set. However, binaries compiled with the newer AVX2 support will not run on e.g. IvyBridge processors. For that we provide two modules for each of the sets. 

In order to use GROMACS::

  $ module add gromacs/5.0.6-avx2

or::

  $ module add gromacs/5.0.6-avx

Important note about GROMACS binary names: starting with the 5.0.x series, GROMACS provides a single wrapper binary, *gmx*, for launching any of the simulation engines (e.g. mdrun) and the pre-processing (e.g. grompp) and analysis tools (e.g. g_rms). The specific tool is provided as an argument to that wrapper binary. For the 5.0.x the original binaries are provided as symbolic links, and thus for users the change will not affect any existing scripts. For example, the following commands are equivalent::

  $ mdrun_mpi 
  $ gmx_mpi mdrun
  
and also::

  $ mpirun -np 2 mdrun_mpi
  $ mpirun -np 2 gmx_mpi mdrun

In the current documentation we will use the new invocation style.

Module *gromacs/5.0.6-avx2* (as well as *gromacs/5.0.6-avx*) provides two versions of the GROMACS suite:

 * *gmx_mpi mdrun* : The MD engine binary with MPI support. This is the one that researchers would use most of the time.
 * *gmx_mpi_d mdrun* : Same as above but in double precision. This one is much slower than the single precision  *mdrun_mpi* and is used only in special cases, such as Normal Mode analysis.

All tools from the GROMACS suite can be launched using any of the above two versions, e.g. you'll find that both *gmx_mpi grompp* and *gmx_mpi_d grompp* work, although for most of the tools there is no actual double precision or MPI support, despite the suffix.

Here is an example script:

.. literalinclude:: files/gromacs.run
    :language: bash

Here we run on 2 nodes (64 processors in total).
Do not run calculations on the login node for anything other than small short tests!!

Now we are ready to submit the calculation::

  $ sbatch gromacs.run
