:orphan:

.. include:: building.inc

First load the Intel environment and FFTW library::

  $ module swap PrgEnv-cray PrgEnv-intel
  $ module add fftw

In the Makefile replace ``-DFFT_DEFAULT`` by ``-DFFT_FFTW3``.

Then build with::

  $ make

The relevant configuration section of the Makefile is::

  SHELL = /bin/sh
  #
  #--------------- Default Configuration for CRAY-XE6-INTEL-OMP ---------------
  SRC  = .
  DEST = .
  BIN  = .
  FFLAGS = -c
  LFLAGS =
  CFLAGS = -c
  CPP = /usr/bin/cpp -P -C -traditional
  CPPFLAGS = -D__Linux -DFFT_FFTW3 -DPARALLEL  \
                 -DPOINTER8 -DMALLOC8
  NOOPT_FLAG =
  CC = cc -O2
  FC = ftn -O2 -g -openmp
  LD = ftn -O2 -g -openmp
  AR = ar
  #----------------------------------------------------------------------------
  # Personal Configuration
  # My_Conf:
  # All arguments:  CRAY-XE6-INTEL-OMP
  #----------------------------------------------------------------------------
  #----------------------------------------------------------------------------
  # End of Personal Configuration
  #----------------------------------------------------------------------------
  CFGDEST = .
  CFGMACH = CRAY-XE6-INTEL-OMP
  CFGQMMM =
