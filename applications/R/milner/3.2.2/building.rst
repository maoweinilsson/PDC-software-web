
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

  $ ./configure --prefix=/pdc/vol/R/3.2.2 --enable-R-shlib --enable-BLAS-shlib
  $ make
  $ make install

binaries are created in the bin directory.

Some packages are installed by default, among them parallel
needed for MPI. To also install other packages you can see
instructions at http://www.bu.edu/tech/support/research/software-and-programming/common-languages/r-basics/r-faq/
In general you can add new packages directly from within R, but take care so
they are installed in the global repository rather than your home catalogue.::

  $ module add R
  $ R
  > .libPaths()
  [1] "/cfs/milner/pdc.vol/R/3.2.2/lib64/R/library"
  
All the packages where installed in the 1st path, which is globally accessible.
To install packages::

  > install.packages("package name",lib=.libPaths()[1])
  
Which will install [package name] in R.
Please, do also check that they work on the compute nodes.

Installed packages

* snow_0.4-1            For MPI support
