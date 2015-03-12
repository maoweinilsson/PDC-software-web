

On Beskow we recommend compiling GROMACS with the GNU compilers::

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add cmake/2.8.12.2
  $ module add git/2.2.0

Building with CMake currently has problems on some CRAY systems when trying to build statically, so::

  $ export CRAYPE_LINK_TYPE=dynamic

Get the sources::

  $ wget ftp://ftp.gromacs.org/pub/gromacs/gromacs-5.0.4.tar.gz
  $ tar xfvz gromacs-5.0.4.tar.gz
  $ mkdir build
  $ cd build

Now configure and build in single precision::

  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/5.0.4 -DGMX_GPU=OFF -DGMX_MPI=ON -DGMX_BUILD_OWN_FFTW=ON -DGMX_DOUBLE=OFF -DGMX_SIMD=AVX2_256 -DGMX_CYCLE_SUBCOUNTERS=ON -DGMX_PREFER_STATIC_LIBS=ON -DGMX_EXTERNAL_BLAS=OFF -DGMX_EXTERNAL_LAPACK=OFF ../gromacs-5.0.4
  $ make -j 8 install

And in double::

  $ make clean
  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/5.0.4 -DGMX_GPU=OFF -DGMX_MPI=ON -DGMX_BUILD_OWN_FFTW=ON -DGMX_DOUBLE=OFF -DGMX_SIMD=AVX2_256 -DGMX_CYCLE_SUBCOUNTERS=ON -DGMX_PREFER_STATIC_LIBS=ON -DGMX_EXTERNAL_BLAS=OFF -DGMX_EXTERNAL_LAPACK=OFF ../gromacs-5.0.4
  $ make -j 8 install
  
If you want to build GROMACS in serial and without Haswell (AVX2) optimizations, use the following::

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add cmake/2.8.12.2
  $ module add git/2.2.0
  $ export CRAYPE_LINK_TYPE=dynamic

  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/5.0.4 -DGMX_GPU=OFF -DGMX_MPI=OFF -DGMX_BUILD_OWN_FFTW=ON -DGMX_DOUBLE=OFF -DGMX_SIMD=AVX_256 -DGMX_CYCLE_SUBCOUNTERS=ON -DGMX_PREFER_STATIC_LIBS=ON -DGMX_EXTERNAL_BLAS=OFF -DGMX_EXTERNAL_LAPACK=OFF -DGMX_THREAD_MPI=OFF -DGMX_OPENMP=OFF -DCMAKE_C_COMPILER=/usr/bin/gcc-4.7 -DCMAKE_CXX_COMPILER=/usr/bin/g++-4.7 ../gromacs-5.0.4
