
Project homepage: http://swift.cmbi.ru.nl/gv/dssp

Fetch the code::

  $ ftp://ftp.cmbi.ru.nl/pub/software/dssp/dssp-2.2.1.tgz
  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add boost/1.57.0-gcc-4.9.1

Patch the makefile::

  $ diff makefile makefile.org
  18,20c18,20
  < DEST_DIR                      = /pdc/vol/dssp/2.2.1
  < LIB_DIR                               = /pdc/vol/boost/1.57.0-gcc-4.9.1/lib
  < INC_DIR                               = /pdc/vol/boost/1.57.0-gcc-4.9.1/include
  ---
  > DEST_DIR                      ?= /usr/local
  > LIB_DIR                               = $(BOOST_LIB_DIR)
  > INC_DIR                               = $(BOOST_INC_DIR)
  28c28
  < CXX                           = CC
  ---
  > CXX                                   = g++

Compile/install::

  $ make install

For Gromacs users: the module sets the DSSP environmental variable to /pdc/vol/dssp/2.2.1/bin/mkdssp, i.e. in your scripts you only need to add "module add dssp" to your scripts.
