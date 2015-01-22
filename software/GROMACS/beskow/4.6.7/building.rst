:orphan:

.. include:: building.inc

On Beskow we recommend compiling GROMACS with the GNU compilers::

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add cmake/2.8.12.2
  $ module add git/2.2.0
  $ module load craype-haswell
  $ module unload cray-libsci/13.0.1

Building with CMake currently has problems on some CRAY systems when trying to build statically, so::

  $ export CRAYPE_LINK_TYPE=dynamic

Get the sources::

  $ wget ftp://ftp.gromacs.org/pub/gromacs/gromacs-4.6.7.tar.gz
  $ tar xfvz gromacs-4.6.7.tar.gz
  $ mkdir build
  $ cd build

Now configure and build in single precision::

  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/4.6.7 -DGMX_GPU=OFF -DGMX_MPI=ON -DGMX_BUILD_OWN_FFTW=ON -DGMX_DOUBLE=OFF -DGMX_CPU_ACCELERATION=AVX_256 -DGMX_CYCLE_SUBCOUNTERS=ON -DGMX_PREFER_STATIC_LIBS=ON -DGMX_EXTERNAL_BLAS=OFF -DGMX_EXTERNAL_LAPACK=OFF ../gromacs-4.6.7
  $ make -j 8 install

And in double::

  $ make clean
  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/4.6.7 -DGMX_GPU=OFF -DGMX_MPI=ON -DGMX_BUILD_OWN_FFTW=ON -DGMX_DOUBLE=OFF -DGMX_CPU_ACCELERATION=AVX_256 -DGMX_CYCLE_SUBCOUNTERS=ON -DGMX_PREFER_STATIC_LIBS=ON -DGMX_EXTERNAL_BLAS=OFF -DGMX_EXTERNAL_LAPACK=OFF ../gromacs-4.6.7
  $ make -j 8 install
  
