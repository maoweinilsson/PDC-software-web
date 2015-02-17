:orphan:

.. include:: using.inc


GROMACS is highly tuned for quite efficient use of HPC resources.
Special assembly kernels make its core compute engine one of the fastest MD
simulation programs.

Beskow is a little special because the compute nodes have Haswell CPUs which
support AVX2 instructions, but those are not supported by the login node.
In the case of GROMACS, AVX2 delivers approximately 40% speed-up over the standard AVX instruction set.

In order to use GROMACS, first you need to change to the GNU the programming environment::

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add gromacs/4.6.7

Note: if you want to use GROMACS with PLUMED support load instead::

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add gromacs/4.6.7-plumed

Module *gromacs/4.6.7* (as well as *gromacs/4.6.7-plumed*) provides three versions of the GROMACS suite:

 * *mdrun_mpi* : The MD engine binary with MPI and AVX2 support. This is the one that researchers would use most of the time.
 * *mdrin_mpi_d* : Same as above but in double precision. This one is much slower than the single precisio  *mdrun_mpi* and is used only in special cases, such as Normal Mode analysis.
 * *mdrun* : This binary is compiled without parallel support (no MPI, no OpenMP, no thread-MPI), and no AVX2 instructions support. I.e. it runs only as a single process, but you're able to run it also on the login node, e.g. for quick tests. It must NOT be used for production runs!!

All tools from the GROMACS suite are available in the above three versions, e.g. you'll find *grompp*, *grompp_mpi*, and *grompp_mpi_d*. In most cases there is no difference between them (almost no tool supports MPI even though the library is linked). If you want to do a quick pre-processing on the login node, you'll be able to use only the non-suffixed versions. On the compute nodes you can use all three versions.

Here is an example script:

.. literalinclude:: files/gromacs.run
    :language: bash

Here we run on 2 nodes (64 processors in total).
Do not run serial calculations on Beskow for anything other than small short tests!!

Now we are ready to submit the calculation::

  $ sbatch gromacs.run

