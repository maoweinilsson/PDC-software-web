:orphan:

.. include:: building.inc

First fetch and build plumed::

  $ unzip plumed2-2.1.1.zip
  $ cd plumed
  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add fftw
  $ ./configure --prefix=/pdc/vol/plumed/2.1.1
  $ make -j 4 install

Check it runs::

  $ /pdc/vol/plumed/2.1.1/bin/plumed -h

Now build GROMACS with support for plumed::


Use a copy of the GROMACS sources::

  $ export CRAY_ROOTFS=DSL
  $ cd /pdc/vol/gromacs/4.6.7/src/gromacs-4.6.7-plumed

First patch them, by choosing 3) gromacs-4.6.7::

  $ /pdc/vol/plumed/2.1.1/bin/plumed patch -p

Use the same procedure for configuring/building::

  $ cd ../build-plumed/
  $ module add cmake/2.8.12.2
  $ module add git/2.2.0
  $ module load craype-haswell
  $ module unload cray-libsci/13.0.1
  $ export CRAYPE_LINK_TYPE=dynamic

Install in a different directory from vanilla GROMACS::

  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/4.6.7-plumed -DGMX_GPU=OFF -DGMX_MPI=ON -DGMX_BUILD_OWN_FFTW=ON -DGMX_DOUBLE=OFF -DGMX_CPU_ACCELERATION=AVX_256 -DGMX_CYCLE_SUBCOUNTERS=ON -DGMX_PREFER_STATIC_LIBS=ON -DGMX_EXTERNAL_BLAS=OFF -DGMX_EXTERNAL_LAPACK=OFF ../gromacs-4.6.7-plumed

Then install in double precision::

  $ make clean
  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/4.6.7 -DGMX_GPU=OFF -DGMX_MPI=ON -DGMX_BUILD_OWN_FFTW=ON -DGMX_DOUBLE=OFF -DGMX_CPU_ACCELERATION=AVX_256 -DGMX_CYCLE_SUBCOUNTERS=ON -DGMX_PREFER_STATIC_LIBS=ON -DGMX_EXTERNAL_BLAS=OFF -DGMX_EXTERNAL_LAPACK=OFF ../gromacs-4.6.7
  $ make -j 8 install

Use the same procedure for Gromacs-5.0.4, but make sure to change the source/binary directories in the cmake command, and the -DGMX_SIMD flag. Refer to the Gromacs-5.0.4 documentation: https://www.pdc.kth.se/software
