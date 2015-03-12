The library has been compiled with GCC and the intel compiler
Both version exists as modules::

  module sw PrgEnv-cray PrgEnv-gnu/PrgEnv-intel
  module add cray-hdf5

Then::

  export CRAYPE_LINK_TYPE=dynamic
  cd build
  ccmake ../src/cgns-3.2.1/
