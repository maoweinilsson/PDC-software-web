

The tool was installed using::

  module swap PrgEnv-cray PrgEnv-gnu
  wget http://www.cmake.org/files/v3.0/cmake-3.6.0.tar.gz
  tar xvzf cmake-3.6.0
  cd cmake-3.6.0
  ./bootstrap --prefix=/pdc/vol/cmake/3.6.0 && make && make install
