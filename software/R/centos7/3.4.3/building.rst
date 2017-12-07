
Followed procedure for building R 3.2.0 with some changes.

First::

  export CC=gcc
  export CXX=g++
  export FC=gfortran
  export F77=gfortran

  module add gcc/7.2.0
  module add jdk/1.8.0_45

This sets the enviroment

Then to configure and build::

  ./configure --prefix=/pdc/vol/R/3.4.3 --enable-R-shlib --enable-BLAS-shlib
  make
  make install

binaries are created in the bin directory, libraries in lib64.

In the module file it is important to also load
modules for jdk and gcc, same versions as above.

