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


