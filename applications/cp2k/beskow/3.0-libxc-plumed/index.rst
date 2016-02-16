:orphan:

:doc:`../../../../index` - :doc:`../../index` - :doc:`index`


Using cp2k 3.0 with libxc and PLUMED on Beskow
=====================================



Below follows an example job script for cp2k.

.. literalinclude:: files/cp2k.run
    :language: bash

Assuming the script is named cp2k.run, it can be submitted using:

.. code-block:: bash

  sbatch cp2k.run

Building cp2k 3.0 with libxc and PLUMED on Beskow
========================================



CP2K is freely available under the GPL license.
http://www.cp2k.org/download

.. code-block:: bash

   tar -xf cp2k-3.0.tar.bz2

Installation instructions can be found in INSTALL or online at:
http://sourceforge.net/p/cp2k/code/HEAD/tree/trunk/cp2k/INSTALL

Instructions for GNU
----------------------

The following arch-file can be used (:code:`arch/CRAY-XC40-gfortran-plumed-libxc.popt`) for a pure MPI build with gnu. Linking is done to PLUMED 2.1.2 and libxc 2.2.2.

.. code-block:: makefile

  CC       = cc
  CPP      =
  FC       = ftn 
  LD       = ftn 
  AR       = ar -r
  CPPFLAGS =
  include /pdc/vol/plumed/2.1.2_noAlmost/lib/plumed/src/lib/Plumed.inc
  EXTERNAL_OBJECTS=$(PLUMED_STATIC_DEPENDENCIES)

  INTEL_PATH = /opt/intel/composer_xe_2013_sp1.4.211
  DFLAGS   = -D__GFORTRAN -D__FFTW3 -D__parallel -D__SCALAPACK -D__BLACS -D__PLUMED2 -D__LIBXC
  CFLAGS   = $(DFLAGS)
  FCFLAGS  = $(DFLAGS) -O3 -mavx -funroll-loops -ffast-math -ftree-vectorize \
             -ffree-form -ffree-line-length-512
  LDFLAGS  = $(FCFLAGS) -static
  MKL_LIB  = ${INTEL_PATH}/mkl/lib/intel64
  LIBS     = -lfftw3
  LIBS    += ${MKL_LIB}/libmkl_scalapack_lp64.a -Wl,--start-group \
             ${MKL_LIB}/libmkl_gf_lp64.a ${MKL_LIB}/libmkl_sequential.a \
             ${MKL_LIB}/libmkl_core.a ${MKL_LIB}/libmkl_blacs_intelmpi_lp64.a -Wl,--end-group \
             -lz -ldl -lstdc++ \
	     -L$(LIBXC_DIR)/lib -lxcf90 -lxc

Build with

.. code-block:: bash

  module swap PrgEnv-cray PrgEnv-gnu
  module load fftw
  make -j <n> ARCH=CRAY-XC40-gfortran-plumed-libxc VERSION="popt"

Test the build with

.. code-block:: bash

  cd tests/QS
  aprun -n 1 -d 32 ../../exe/CRAY-XC40-gfortran-plumed-libxc/cp2k.popt C.inp

