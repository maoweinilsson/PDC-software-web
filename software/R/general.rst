

Instructions for using R at PDC
===============================

R is a programming language and software environment for statistical computing and graphics supported by the R Foundation for Statistical Computing. The R language is widely used among statisticians and data miners for developing statistical software and data analysis. Polls, surveys of data miners, and studies of scholarly literature databases show that R's popularity has increased substantially in recent years
More information can be found at https://cran.r-project.org/

R Packages
----------

List Packages
^^^^^^^^^^^^^

To see a list of installed packages, please type::

  > installed.packages()

Install packages
^^^^^^^^^^^^^^^^
  
Some packages are installed by default.
instructions at http://www.bu.edu/tech/support/research/software-and-programming/common-languages/r-basics/r-faq/
In general you can add new packages directly from within R, but to be globally accessible
they must be installed in the global repository rather than your home catalogue.::

  $ module add R
  $ R
  > .libPaths()
  [1] "/afs/pdc.kth.se/home/h/hzazzi/R/library"             
  [2] "/pdc/vol/R/3.2.0/lib64/R/library"
  
All the packages where installed in the 2nd path, which is globally accessible.
To install packages::

  > install.packages("package name",lib=.libPaths()[2])
  
Which will install [package name] in R.

**OBS** Always try to use the swedish repository for packages. There is a bug in R 3.2.2, meaning
you will get a short list of CRAN repositories. In this case choose (HTTP mirrors) and then the swedish respoitory.

Special installation instructions for Tegner and Rmpi
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To install Rmpi you need to have compile the package using OpenMPI, therefore
we need to redirect the compile.::

  $ module add gcc/5.1 openmpi/1.8-gcc-5.1
  $ R
  $ install.packages("Rmpi", lib = .libPaths()[2], configure.args = "--with-Rmpi-type=OPENMPI --with-Rmpi-libpath=/pdc/vol/openmpi/1.8/gcc/5.1/lib --with-Rmpi-include=/pdc/vol/openmpi/1.8/gcc/5.1/include --with-Rmpi=/pdc/vol/openmpi/1.8/gcc/5.1")

Special installation instructions for Beskow and Rmpi
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To install Rmpi you need to have compile the package using MPI, and also remove 
dependency of the library opa.

#. download Rmpi from https://cran.r-project.org/web/packages/Rmpi/index.html
#. Unpack 
#. Edit configure and create a new entry called CRAY_NOLOPA, which is the same as CRAY without **-lopa**
#. pack into tar.gz
#. ::
     $ MPICH_CRAY=/opt/cray/mpt/7.0.5/gni/mpich2-cray64/83
     $ MAKEFLAGS="CC=cc" R CMD INSTALL Rmpi.tar.gz --configure-args="--with-Rmpi-include=$MPICH_CRAY/include --with-Rmpi-libpath=$MPICH_CRAY/lib --with-Rmpi-type=CRAY_NOLOPA CC=cc" --no-test-load

More information can be found in http://www.ahschulz.de/2015/01/02/installing-r-on-hlrn-cray-xc30xc40-and-enabling-rmpi/
