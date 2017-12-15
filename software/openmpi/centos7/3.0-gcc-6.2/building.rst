
Software was downloaded from https://www.open-mpi.org/software/ompi/v3.0/downloads/openmpi-3.0.0.tar.gz

Build was made by
::

  module add gcc/6.2.0
  ./configure --prefix=/pdc/vol/openmpi/3.0/gcc/6.2.0
  make
  make install

Appropriate folders was made prior of build.
For building with openmpi *C_INCLUDE_PATH* is needed, which
is defined in the module file.
