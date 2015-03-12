

for simplicity not cross compiling and using gcc

Interestingly 

.. code-block:: bash

  export CRAYPE_LINK_TYPE=dynamic

breaks the configure script (likely only static versions of the libraries available), so using static linking.

.. code-block:: bash

  module swap PrgEnv-cray PrgEnv-gnu
  
  module load cray-netcdf-hdf5parallel/4.3.2
  module load fftw/3.3.4.1
  
  export CC=cc
  export CXX=CC
  ./configure --with-netcdf=yes --with-hdf5=yes --with-fftw3 --prefix=/pdc/vol/cdo/1.6.7
  
  make -j 4
  
  make install

