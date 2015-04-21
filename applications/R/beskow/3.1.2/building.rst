
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

Some packages are installed by default, among them parallel
needed for MPI. To also install other packages
Download them and save them to /pdc/vol/R/3.1.2/downloaded_packages. Then::

  $ ./R CMD INSTALL /pdc/vol/R/3.1.2/downloaded_packages/[package name].tar.gz

Apparently when running on compute nodes, it did not find package snow anyway, so
the package was installed there as well using::

  $ salloc -t 60 aprun -n 1 ./R CMD INSTALL /pdc/vol/R/3.1.2/downloaded_packages/[package name].tar.gz
  
Installed packages

* snow_0.3-13           For MPI support

* RColorBrewer_1.1-2

* signal_0.7.4

