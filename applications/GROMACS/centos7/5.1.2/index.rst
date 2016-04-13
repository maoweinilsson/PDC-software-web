:orphan:

:doc:`../../../../index` - :doc:`../../index` - :doc:`index`


Using GROMACS 5.1.2 on Tegner
=============================

GROMACS is highly tuned for quite efficient use of HPC resources. Special assembly kernels make its core compute engine one of the fastest MD simulation programs.

Compute nodes, which have Haswell CPUs, can support AVX2 instructions, and deliver approximately 40% speed-up over the standard AVX instruction set. However, binaries compiled with the newer AVX2 support will not run on e.g. IvyBridge processors. For that we provide two modules for each of the sets. 

In order to use GROMACS::

  $ module add gromacs/5.1.2-avx2

or::

  $ module add gromacs/5.1.2-avx

Important note about GROMACS binary names: starting with the 5.1 series, GROMACS provides a single wrapper binary, *gmx*, for launching any of the simulation engines (e.g. mdrun) and the pre-processing (e.g. grompp) and analysis tools (e.g. g_rms). The specific tool is provided as an argument to that wrapper binary. In pre-5.1 versions the original binaries were provided as symbolic links but now users would need to update existing scripts. For example the following commands need to be substited as follows::

  $ mdrun_mpi => $ gmx_mpi mdrun
  $ g_rms    => $ gmx_mpi rms
  
and also::

  $ mpirun -np 2 gmx_mpi mdrun


Module *gromacs/5.1.2-avx2* (as well as *gromacs/5.1.2-avx*) provides two versions of the GROMACS suite:

 * *gmx_mpi mdrun* : The MD engine binary with MPI support. This is the one that researchers would use most of the time.
 * *gmx_mpi_d mdrun* : Same as above but in double precision. This one is much slower than the single precision  *mdrun_mpi*. It is used only in special cases, such as Normal Mode analysis.

Here is an example script where we run on 1 Haswell node (24 processors in total). Do not run calculations on the login node for anything other than small short tests!!

.. literalinclude:: files/gromacs.run
    :language: bash

Another example for running on a Haswell node with a GPU, where we furthermore take advantage of multi-level parallelization with MPI and OpenMP is as follows: 

.. literalinclude:: files/gromacs-gpu.run
    :language: bash

Now we are ready to submit the calculation::

  $ sbatch gromacs.run

Building GROMACS 5.1.2 on Tegner
================================

On Tegner we recommend compiling GROMACS with the GNU compilers and IntelMPI::

  $ module add gcc/4.8.4
  $ module add intelmpi/5.0.3
  $ module load fftw/3.3.4-gcc-8.4-intelmpi-5.0.3-single
  $ module add cuda/7.0
  $ module add cmake/3.1.3
  $ module add git/2.3.0

Get the sources::

  $ wget ftp://ftp.gromacs.org/pub/gromacs/gromacs-5.1.2.tar.gz
  $ tar xfvz gromacs-5.1.2.tar.gz
  $ mkdir build
  $ cd build

Now configure and build in single precision with AVX2 (Haswell) support. The GPU is automatically detected (thus you don't really need for explicit -DGMX_GPU=ON) since we have loaded the cuda module::

  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/5.1.2/amd64_co7/haswell_intelmpi -DGMX_GPU=ON -DGMX_DOUBLE=OFF -DGMX_SIMD=AVX2_256 -DGMX_MPI=ON -DGMX_CYCLE_SUBCOUNTERS=ON -DGMX_PREFER_STATIC_LIBS=ON -DBUILD_SHARED_LIBS=OFF -DGMX_EXTERNAL_BLAS=OFF -DGMX_EXTERNAL_LAPACK=OFF ../gromacs-5.1.2  -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DMPI_C_COMPILER=mpicc -DMPI_CXX_COMPILER=mpicxx -DCMAKE_PREFIX_PATH=/pdc/vol/fftw/3.3.4/gcc/8.4/intelmpi/5.0.3/single -DCUDA_NVCC_FLAGS="-gencode;arch=compute_37,code=sm_37;"

  $ make -j 8 install

Then for double (GPU not supported in double)::

  $ cmake -DCMAKE_PREFIX_PATH=/pdc/vol/fftw/3.3.4/gcc/8.4/intelmpi/5.0.3/double -DGMX_DOUBLE=ON -DGMX_SIMD=AVX2_256 -DGMX_GPU=OFF ../gromacs-5.1.2
  $ make -j 8 install
  
For Ivy Bridge - run both of the above commands but replace *-DGMX_SIMD=AVX2_256* with *-DGMX_SIMD=AVX_256*, and the installation directory to *-DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/5.1.2/amd64_co7/ivy_intelmpi*
