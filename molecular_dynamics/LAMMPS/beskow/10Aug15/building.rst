Building with meam support

using intel compiler and FFTW3

::

  module swap PrgEnv-cray PrgEnv-intel
  module swap intel/14.0.4.211 intel/15.0.2.164
  module load fftw/3.3.4.0



MEAM
----

Need to build meam first, then build LAMMPS

::
  
  cd lib/meam

edit the Makefile.ifort

::  
  
  F90 =           ftn
  ARCHIVE =       xiar


make -f Makefile.ifort

update Makefile.lammps (in lib/meam; merged Makefile.lammps from
previous version with Makefile.ifort)

:: 

  # Settings that the LAMMPS build will import when this package library is used
  
  meam_SYSINC =
  meam_SYSLIB = -lifcore -lsvml -limf
  meam_SYSPATH = -L/pdc/vol/intel/2015.2.164/composer_xe_2015.2.164/compiler/lib/intel64/


main program
------------


Basic makefile is

MAKE/MACHINES/Makefile.xe6

cd src


update MAKE/MACHINES/Makefile.xe6 so

CCFLAGS =       -g -O3 -openmp -DLAMMPS_MEMALIGN=64 -no-offload \
                 -fno-alias -ansi-alias -restrict -override-limits \
                  
LINKFLAGS =     -g -O3 -openmp

FFT_INC =       -DFFT_FFTW3
FFT_PATH =      
FFT_LIB =

then

make yes-meam
make yes-rigid
make yes-xtc
make -j 6 xe6

