

CP2K is freely available under the GPL license.
http://www.cp2k.org/download

.. code-block:: bash

   tar -xf cp2k-2.6.2.tar.bz2

Installation instructions can be found in INSTALL or online at:
http://sourceforge.net/p/cp2k/code/HEAD/tree/trunk/cp2k/INSTALL

Instructions for Intel
----------------------

The following arch-file can be used (:code:`arch/CRAY-XC40-intel.popt`) for a pure MPI build with intel.

.. code-block:: makefile

  CC       = cc
  CPP      =   
  FC       = ftn 
  LD       = ftn 
  AR       = ar -r
  CPPFLAGS =
  DFLAGS   = -D__INTEL -D__MKL -D__FFTW3 -D__parallel -D__SCALAPACK -D__HAS_NO_SHARED_GLIBC \
             -D__BLACS                                 
  CFLAGS   = $(DFLAGS) -O2 
  FCFLAGS  = $(DFLAGS) -O2 -pad -opt-prefetch  -funroll-loops -fpp -free \
             -nogen-interfaces \
       -I${MKLROOT}/include -I${MKLROOT}/include/fftw
  LDFLAGS  = $(FCFLAGS)
  MKL_LIB  = ${MKLROOT}/lib/intel64
  LIBS     = $(MKL_LIB)/libmkl_scalapack_lp64.a -Wl,--start-group \
             $(MKL_LIB)/libmkl_intel_lp64.a ${MKL_LIB}/libmkl_sequential.a \
             $(MKL_LIB)/libmkl_core.a -Wl,--end-group \
             ${MKL_LIB}/libmkl_blacs_intelmpi_lp64.a


Build with

.. code-block:: bash

  module swap PrgEnv-cray PrgEnv-intel
  make -j <n> ARCH=CRAY-XC40-intel VERSION="popt"

Test the build with

.. code-block:: bash

  cd tests/QS
  aprun -n 1 -d 32 ../../exe/CRAY-XC40-intel/cp2k.popt C.inp

