GROMACS is highly tuned for quite efficient use of HPC resources.
Special assembly kernels make its core compute engine one of the fastest MD
simulation programs.

Beskow is a little special because the compute nodes have Haswell CPUs which
support AVX2 instructions, but those are not supported by the login node.
In the case of GROMACS, AVX2 delivers approximately 40% speed-up over the standard AVX instruction set.

In order to use GROMACS, first you need to change to the GNU the programming environment::

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add gromacs/5.1

Note: if you want to use GROMACS with PLUMED support load instead::

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add gromacs/5.1-plumed

Important note about GROMACS binary names: starting with the 5.1 series, GROMACS provides a single wrapper binary, *gmx*, for launching any of the simulation engines (e.g. mdrun) and the pre-processing (e.g. grompp) and analysis tools (e.g. g_rms). The specific tool is provided as an argument to that wrapper binary. In pre-5.1 versions the original binaries were provided as symbolic links but now users would need to update existing scripts. For example the following commands need to be substited as follows::

  $ mdrun_mpi => $ gmx_mpi mdrun
  $ g_rms    => $ gmx_mpi rms


A list of available commands can be seen by::

  $ gmx_seq help commands


Module *gromacs/5.1* (as well as *gromacs/5.1-plumed*) provides three versions of the GROMACS suite:

 * *gmx_mpi mdrun* : The MD engine binary with MPI and AVX2 support. This is the one that researchers would use most of the time.
 * *gmx_mpi_d mdrun* : Same as above but in double precision. This one is much slower than the single precisio  *mdrun_mpi* and is used only in special cases, such as Normal Mode analysis.
 * *gmx_seq mdrun* : This binary is compiled without parallel support (no MPI, no OpenMP, no thread-MPI), and no AVX2 instructions support. I.e. it runs only as a single process, but you're able to run it also on the login node, e.g. for quick tests. It must NOT be used for production runs!!

All tools from the GROMACS suite can be launched using any of the above three versions, e.g. *gmx_seq grompp*, *gmx_mpi grompp*, and *gmx_mpi_d grompp* etc. all work. In most cases there is no difference between them (very few tools support MPI even though the library is linked). If you want to do a quick pre-processing on the login node, you'll be able to use only the "_seq"-suffixed versions. On the compute nodes you can use all three versions.

Remember to *always* use in your scripts *aprun* in front of the actual GROMACS command! Here is an example script:

.. literalinclude:: files/gromacs.run
    :language: bash

Here we run on 2 nodes (64 processors in total).
Do not run serial calculations on Beskow for anything other than small short tests!!

Now we are ready to submit the calculation::

  $ sbatch gromacs.run

