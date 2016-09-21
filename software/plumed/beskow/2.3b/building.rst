This version is compiled with support for ALMOST (http://www-almost.ch.cam.ac.uk/site/almost.html).

First fetch and build plumed. We do not build it with Almost since this gives compilation problems for Gromacs when adding Plumed support::

  $ tar xvfz plumed-2.3b.tgz
  $ cd plumed
  $ module swap PrgEnv-cray PrgEnv-gnu
  $ export CRAYPE_LINK_TYPE=dynamic
  $ ./configure --prefix=/pdc/vol/plumed/2.3b CXX=CC CC=cc 
  $ make -j 4 install

Check it runs::

  $ /pdc/vol/plumed/2.3b/bin/plumed -h

Now build GROMACS with support for plumed. Install in a different directory from vanilla GROMACS.

Use a copy of the GROMACS sources::

  $ export CRAY_ROOTFS=DSL
  $ mkdir -p /pdc/vol/gromacs/2016.1-plumed_2.3b/src
  $ cd /pdc/vol/gromacs/2016.1-plumed_2.3b/src
  $ cp ../../2016.1/src/gromacs-2016.tar.gz .
  $ tar zxf gromacs-2016.tar.gz 
  
First patch the Gromacs source by choosing option 2), gromacs-2016::

  $ aprun -n 1 /pdc/vol/plumed/2.3b/bin/plumed-patch -p

Use the same procedure as normally for Gromacs for configuring/building::

  $ cd ../build
  $ module add cmake/2.8.12.2
  $ module add git/2.2.0
  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/2016.1-plumed_2.3b -DGMX_GPU=OFF -DGMX_MPI=ON -DGMX_BUILD_OWN_FFTW=ON -DGMX_DOUBLE=OFF -DGMX_CPU_ACCELERATION=AVX2_256 -DGMX_CYCLE_SUBCOUNTERS=ON -DGMX_PREFER_STATIC_LIBS=ON -DGMX_EXTERNAL_BLAS=OFF -DGMX_EXTERNAL_LAPACK=OFF ../gromacs-2016

Then install in double precision::

  $ make clean
  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/2016.1-plumed_2.3b -DGMX_GPU=OFF -DGMX_MPI=ON -DGMX_BUILD_OWN_FFTW=ON -DGMX_DOUBLE=ON -DGMX_CPU_ACCELERATION=AVX2_256 -DGMX_CYCLE_SUBCOUNTERS=ON -DGMX_PREFER_STATIC_LIBS=ON -DGMX_EXTERNAL_BLAS=OFF -DGMX_EXTERNAL_LAPACK=OFF ../gromacs-2016
  $ make -j 8 install

Refer to the Gromacs-2016 documentation for further information: https://www.pdc.kth.se/software
