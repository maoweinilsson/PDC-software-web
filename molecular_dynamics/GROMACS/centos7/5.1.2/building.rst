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
