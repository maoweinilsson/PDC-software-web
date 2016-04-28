

On Beskow we recommend compiling GROMACS with the GNU compilers::

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add fftw/3.3.4.3
  $ module add cmake/2.8.12.2
  $ module add git/2.2.0

Building with CMake currently has problems on some CRAY systems when trying to build statically, so::

  $ export CRAYPE_LINK_TYPE=dynamic

Get the sources::

  $ wget ftp://ftp.gromacs.org/pub/gromacs/gromacs-5.1.2.tar.gz
  $ tar xfvz gromacs-5.1.2.tar.gz
  $ mkdir build
  $ cd build

Now configure and build in single precision. We will use fftw library provided by Cray::

  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/5.1.2 -DGMX_GPU=OFF -DGMX_MPI=ON -DCMAKE_PREFIX_PATH=/opt/cray/fftw/3.3.4.3/haswell -DGMX_DOUBLE=OFF -DGMX_SIMD=AVX2_256 -DGMX_CYCLE_SUBCOUNTERS=ON -DGMX_PREFER_STATIC_LIBS=ON -DGMX_EXTERNAL_BLAS=OFF -DGMX_EXTERNAL_LAPACK=OFF ../gromacs-5.1.2
  $ make -j 8 install

And in double::

  $ make clean
  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/5.1.2 -DGMX_GPU=OFF -DGMX_MPI=ON -DCMAKE_PREFIX_PATH=/opt/cray/fftw/3.3.4.3/haswell -DGMX_DOUBLE=ON -DGMX_SIMD=AVX2_256 -DGMX_CYCLE_SUBCOUNTERS=ON -DGMX_PREFER_STATIC_LIBS=ON -DGMX_EXTERNAL_BLAS=OFF -DGMX_EXTERNAL_LAPACK=OFF ../gromacs-5.1.2
  $ make -j 8 install
  
If you want to build GROMACS in serial and without Haswell (AVX2) optimizations, use the following (note the last 3 arguments of cmake about how to add a custom suffix, and that we are using the system gcc-4.7)::

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add cmake/2.8.12.2
  $ module add git/2.2.0
  $ export CRAYPE_LINK_TYPE=dynamic

  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/5.1.2 -DGMX_GPU=OFF -DGMX_MPI=OFF -DCMAKE_PREFIX_PATH=/opt/cray/fftw/3.3.4.3/haswell -DGMX_DOUBLE=OFF -DGMX_SIMD=AVX_256 -DGMX_CYCLE_SUBCOUNTERS=ON -DGMX_PREFER_STATIC_LIBS=ON -DGMX_EXTERNAL_BLAS=OFF -DGMX_EXTERNAL_LAPACK=OFF -DGMX_THREAD_MPI=OFF -DGMX_OPENMP=OFF -DCMAKE_C_COMPILER=/usr/bin/gcc-4.7 -DCMAKE_CXX_COMPILER=/usr/bin/g++-4.7 ../gromacs-5.1.2 -DGMX_BINARY_SUFFIX=_seq  -DGMX_DEFAULT_SUFFIX=OFF -DGMX_LIBS_SUFFIX=_seq

  $ make -j 8 install

To build GROMACS 5.1.2 with PLUMED 2.2.1 (required for GROMACS version 5.1 and above), one first needs to patch the source by::

  $ aprun -n 1 /pdc/vol/plumed/2.2.1/bin/plumed-patch -p

and then proceeding with the GROMACS installation as normal, i.e. (for single precision)::

  $ mkdir build-plumed_2.2.1
  $ cd build-plumed_2.2.1

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add cmake/2.8.12.2
  $ module add git/2.2.0
  $ export CRAYPE_LINK_TYPE=dynamic

  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/5.1.2-plumed_2.2.1 -DGMX_GPU=OFF -DGMX_MPI=ON -DCMAKE_PREFIX_PATH=/opt/cray/fftw/3.3.4.3/haswell -DGMX_DOUBLE=OFF -DGMX_SIMD=AVX2_256 -DGMX_CYCLE_SUBCOUNTERS=ON -DGMX_PREFER_STATIC_LIBS=ON -DGMX_EXTERNAL_BLAS=OFF -DGMX_EXTERNAL_LAPACK=OFF ../gromacs-5.1.2-pl
  $ make -j 8 install

and similarly for double precision.
