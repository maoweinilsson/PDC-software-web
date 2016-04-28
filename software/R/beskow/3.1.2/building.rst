
Followed partly the instructions on this link
http://lostingeospace.blogspot.se/2012/06/r-and-hpc-blas-mpi-in-linux-environment.html

First::

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ export CC=gcc
  $ export CXX=g++
  $ export FC=gfortran
  $ export F77=gfortran

This sets the enviroment

Then to configure and build::

  $ ./configure --prefix=/pdc/vol/R/3.1.2 --enable-R-shlib --enable-BLAS-shlib
  $ make
  $ make install

binaries are created in the bin directory.
Although to make it work you also have to add::

  $ export LD_LIBRARY_PATH=/opt/gcc/4.9.1/snos/lib64:$LD_LIBRARY_PATH

This has been added in its respective module.
