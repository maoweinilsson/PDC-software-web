Extract files and set AMBERHOME
-------------------------------

::

  tar jxvf AmberTools17.tar.bz2
  tar jxvf Amber16.tar.bz2
  cd amber16
  export AMBERHOME=`pwd`


Modules
-------

::

  module load cuda/8.0
  module load i-compilers/15.0.2
  module load intelmpi/5.0.3
  module load fftw/3.3.4-intel-15.0.2-intelmpi-5.0.3-double


Serial, MPI only, CUDA only, MPI-CUDA builds
--------------------------------------------

We need to configure, build and clean for each of the different execution binaries

::

  ./configure -noX11 intel
  make -j 8 install
  make clean

  ./configure -intelmpi -noX11 intel
  make -j 8 install
  make clean

  ./configure -cuda -noX11 intel
  make -j 8 install
  make clean

  ./configure -intelmpi -cuda -noX11 intel
  make -j 8 install

  make test


Patches
-------

The configure script downloads and suggests applying patches.

::

 We have applied the following patches:

 Available AmberTools 14 patches:

 update.1.bz2, update.2, update.3, update.4, update.5, update.6, update.7, update.8, update.9, update.10,
 update.11, update.12, update.13, update.14.bz2, update.15, update.16, update.17, update.18, update.19, update.20,
 update.21, update.22, update.23, update.24, update.25, update.26, update.27

 Available Amber 14 patches:

 update.1, update.2, update.3, update.4, update.5, update.6, update.7, update.8, update.9, update.10,
 update.11, update.12

Testing the code
----------------

Adapt the code below and run it

::

  #!/bin/bash

  module add amber/14

  export AMBERHOME=/pdc/vol/amber/14/amber14
  export LD_LIBRARY_PATH=${AMBERHOME}/lib:$LD_LIBRARY_PATH
  export DO_PARALLEL="mpirun -np 8"
  
  cd $AMBERHOME
  make test

To test in serial set the DO_PARALLEL variable to an empty string.
