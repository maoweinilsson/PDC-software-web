:orphan:

.. include:: building.inc

CDO is normally just used on the login nodes.

Set the modules::

  module swap PrgEnv-cray PrgEnv-gnu
  module load cray-netcdf-hdf5parallel/4.3.2
  module load fftw/3.3.4.1

Set the compiler to cc::

  export CC=cc
  export CXX=CC

Configure line::

  ./configure --with-netcdf=yes --with-hdf5=yes --with-fftw3 --prefix=/pdc/vol/cdo/1.6.7

make::

  make -j 4
  make install

