:orphan:

.. include:: building.inc

for simplicity not cross compiling, using gcc and building dynamically

.. code-block:: bash

  module swap PrgEnv-cray PrgEnv-gnu
  
  module load cray-netcdf-hdf5parallel/4.3.2
  module load fftw/3.3.4.1
  
  export CC=cc
  export CXX=CC
  ./configure --with-netcdf=yes --with-hdf5=yes --with-fftw3 --prefix=/pdc/vol/cdo/1.6.7
  
  export CRAYPE_LINK_TYPE=dynamic
  
  make -j 4
  
  make install

