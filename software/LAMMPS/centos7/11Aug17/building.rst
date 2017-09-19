Building LAMMPS 11Mar17

Using Intel compiler, FFTW3 and CUDA

::

  module add i-compilers/16.0.3
  module add intelmpi/5.1.3
  module add fftw/3.3.4-intel-16.0.3-intelmpi-5.1.3-double
  module add cuda/8.0


Included packages
-----------------

The following packages are included by typing "make yes-packagename": 
USER-MISC, USER-CGSDK, USER-TALLY, RIGID, REPLICA, MOLECULE, MC, MANYBODY, KSPACE, GPU.

Need to build GPU library first.
Edit Makefile.pdc under lib/gpu. Set 
::

   CUDA_ARCH = -arch=sm_37
   LMP_INC = -DLAMMPS_SMALLBIG  
   CUDA_PRECISION = -D_SINGLE_DOUBLE # (for accumulation of forces etc. in double).

Then do under src/
::

  make lib-gpu args="-m pdc -a 37 -p mixed -o pdc.mixed -b"

Main program
------------

Edit the Makefile.pdc under src/MAKE.
Note: pair_list.cpp needs to be compiled with -restrict (otherwise it fails due to the _noalias constructs on lines 88-89).

::

   CC =            mpiicc
   CCFLAGS =       -O3
   SHFLAGS =       -fPIC
   DEPFLAGS =      -M
   LINK =          mpiicc
   LINKFLAGS =     -O3
   LIB =           -lstdc++
   SIZE =          size
   FFT_INC =       -DFFT_MKL -I/pdc/vol/i-compilers/16.0.3/mkl/include
   FFT_PATH =      -L/pdc/vol/i-compilers/16.0.3/mkl/lib/intel64
   FFT_LIB =       -lmkl_intel_lp64 -lmkl_core -lmkl_sequential -lpthread

Then, to compile:

::

   make -j 6 pdc

