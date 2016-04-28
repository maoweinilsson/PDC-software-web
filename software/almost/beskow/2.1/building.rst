Note that in order to add support for almost in plumed, you *HAVE TO* use code from the following SVN repo, not the official website. 

  $ svn checkout svn://svn.code.sf.net/p/almost/code/branches/almost-2.1
  $ cd amlmost-2.1

Note: newer versions (e.g. 2.2, 3.0) didn't work with plumed.

Before compilation we need to fix the automake system::

  $ autoreconf -fi
  $ automake

Version 2.1 is provided in two flavors - with and without lapack support. 

Without lapack support, one can simply run::

  $ export CRAYPE_LINK_TYPE=dynamic
  $ module swap PrgEnv-cray PrgEnv-gnu
  $ ./configure --prefix=/pdc/vol/almost/2.1 CC=cc CXX=CC CXXFLAGS="-O3 -fPIC" CFLAGS="-O3 -fPIC"
  $ make -j 4 install
