:orphan:

.. include:: building.inc

On Tegner we recommend compiling GROMACS with the GNU compilers::

  $ module add gcc/4.9.2
  $ module add openmpi/1.8-gcc-4.9
  $ module add cmake/3.1.3
  $ module add git/2.3.0

Get the sources::

  $ wget ftp://ftp.gromacs.org/pub/gromacs/gromacs-5.0.4.tar.gz
  $ tar xfvz gromacs-5.0.4.tar.gz
  $ mkdir build
  $ cd build

Now configure and build in single precision with AVX2 (Haswell) support::

  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/5.0.4/amd64_co7/haswell -DGMX_GPU=OFF -DGMX_MPI=ON -DGMX_BUILD_OWN_FFTW=ON -DGMX_DOUBLE=OFF -DGMX_SIMD=AVX2_256 -DGMX_CYCLE_SUBCOUNTERS=ON -DGMX_PREFER_STATIC_LIBS=ON -DBUILD_SHARED_LIBS=OFF -DGMX_EXTERNAL_BLAS=OFF -DGMX_EXTERNAL_LAPACK=OFF ../gromacs-5.0.4  -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpic++
  $ make -j 8 install

Then for double::

  $ make clean
  $ cmake -DGMX_DOUBLE=ON -DGMX_SIMD=AVX2_256 ../gromacs-5.0.4
  $ make -j 8 install
  
For Ivy Bridge - run both of the above commands but replace *-DGMX_SIMD=AVX2_256* with *-DGMX_SIMD=AVX_256*, and the installation directory to *-DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/5.0.4/amd64_co7/ivy*
