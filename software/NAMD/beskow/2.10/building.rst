

Some instructions for building NAMD on Archer version 2.9:
<http://www.archer.ac.uk/documentation/software/namd/compiling_2.9.php>

Load relevant modules::
  module swap PrgEnv-cray PrgEnv-intel
  module load rca

Start with tcl 8.4::

  cd unix
  aprun -b -n 1 ./configure --enable-icc --disable-load --disable-shared --disable-threads --prefix=/pdc/vol/tcl/8.4

Edit following lines in Makefile::

  CC = cc -pipe -m64  -march=native
  CFLAGS_OPTIMIZE = -O3
  ENV_FLAGS = -DNO_UNAME

To build::

  aprun -n 1 -cc none make clean
  aprun -n 1 -cc none make -j 32
  aprun -n 1 -cc none make install

8.4 failed, so try 8.5

Unpack Unpack source which comes with NAMD::

  tar -xvf charm-6.5.1.tar

Build::

  ./build charm++ mpi-crayxc -O -DCMK_OPTIMIZE=1
  source which comes with NAMD

Architecture files::

  cd arch

Modify CRAY-XC.fftw to be the following::

  FFTLIB=-lsrfftw -lsfftw
  FFTFLAGS=-DNAMD_FFTW
  FFT=$(FFTINCL) $(FFTFLAGS)

Modify the following lines in CRAY-XC.tcl to point to TCL 8.4 location and version 8.4, e.g::

  TCLDIR=/pdc/vol/tcl/8.4
  TCLLIB=-L$(TCLDIR)/lib -ltcl8.4

Modify CRAY-XC-intel.arch::

  CHARMARCH = mpi-crayxc

Configure::

  ./config CRAY-XC-intel

Make::

  cd CRAY-XC-intel
  make

then make a tar file::

  make release

  cd /pdc/vol/namd/2.10
  tar xf src/NAMD_2.10_Source/CRAY-XC-intel/NAMD_2.10_CRAY-XC-MPI.tar.gz
  mv NAMD_2.10_CRAY-XC-MPI/ bin

ok try again, need to build with workaround for the all-to-all

1. Load the module craype-hugepages32M (32 can be a different number, most successful are 8, 16 and 32) before compilation

2. Link the libdmapp in - provide  “-Wl,--whole-archive,-ldmapp,--no-whole-archive” for 
  the compilation during the linking stage when building a static binary, for a dynamic binary “-ldmapp” suffices.

3. Insert the following in the batch job scripts of these codes::

     export HUGETLB_VERBOSE=0
     export HUGETLB_DEFAULT_PAGE_SIZE=32M
     export HUGETLB_MORECORE_HEAPBASE=10000000000
     export HUGETLB_MORECORE=yes
     export HUGETLB_ELFMAP=W
     export HUGETLB_FORCE_ELFMAP=yes+
     export MPICH_USE_DMAPP_COLL=1

