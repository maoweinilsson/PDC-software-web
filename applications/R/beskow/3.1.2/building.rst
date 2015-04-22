
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
needed for MPI. To also install other packages you can see
instructions at http://www.bu.edu/tech/support/research/software-and-programming/common-languages/r-basics/r-faq/
In general you can add new packages directly from within R, but take care so
they are installed in the global repository rather than your home catalogue.::

  $ module add R
  $ R
  > .libPaths()
  [1] "/afs/pdc.kth.se/home/h/hzazzi/R/library"             
  [2] "/cfs/rydqvist/pdc.vol.beskow/R/3.1.2/lib64/R/library"
  
All the packages where installed in the 2nd path, which is globally accessible.
To install packages::

  > install.packages("package name",lib=.libPaths()[2])
  
Which will install [package name] in R.
Please, do also check that they work on the compute nodes.

Installed packages

* snow_0.3-13           For MPI support

* RColorBrewer_1.1-2

* signal_0.7.4

