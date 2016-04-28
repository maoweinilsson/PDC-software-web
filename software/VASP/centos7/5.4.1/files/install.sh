# Precompiler options
CPP_OPTIONS= -DMPI -DHOST=\"Tegner\" \
             -DIFC \
             -DCACHE_SIZE=4096 \
             -DPGF90 \
             -Davoidalloc \
             -DMPI_BLOCK=65536 \
             -DscaLAPACK \
             -Duse_collective \
             -DnoAugXCmeta \
             -Duse_bse_te \
             -Duse_shmem \
             -Dtbdyn

CPP        = fpp -f_com=no -free -w0  $*$(FUFFIX) $*$(SUFFIX) $(CPP_OPTIONS)

FC         = mpiifort
FCL        = $(FC) -mkl

FREE       = -free -names lowercase

FFLAGS     = -I/pdc/vol/i-compilers/15.0.2/mkl/include/fftw -FR -lower_case -assume byterecl
OFLAG      = -O3 -ip -fno-alias -unroll-aggressive -opt-prefetch -use-intel-optimized-headers -no-prec-div
OFLAG_IN   = $(OFLAG)
DEBUG      = -O0

MKL_PATH   = $(MKLROOT)/lib/intel64
BLAS       =
LAPACK     =
BLACS      =
SCALAPACK  =

OBJECTS    = fftmpiw.o fftmpi_map.o fftw3d.o fft3dlib.o
INCS       =

LLIBS      = ${MKL_PATH}/libmkl_blas95_lp64.a ${MKL_PATH}/libmkl_lapack95_lp64.a \
             ${MKL_PATH}/libmkl_scalapack_lp64.a  \
             -Wl,--start-group ${MKL_PATH}/libmkl_intel_lp64.a \
             ${MKL_PATH}/libmkl_sequential.a ${MKL_PATH}/libmkl_core.a \
             ${MKL_PATH}/libmkl_blacs_intelmpi_lp64.a  -Wl,--end-group

OBJECTS_O1 += fft3dfurth.o fftw3d.o fftmpi.o fftmpiw.o
OBJECTS_O2 += fft3dlib.o

# For what used to be vasp.5.lib
CPP_LIB    = $(CPP)
FC_LIB     = $(FC)
CC_LIB     = cc
CFLAGS_LIB = -O
FFLAGS_LIB = -O1
FREE_LIB   = $(FREE)

OBJECTS_LIB= linpack_double.o getshmem.o

# Normally no need to change this
SRCDIR     = ../../src
BINDIR     = ../../bin

