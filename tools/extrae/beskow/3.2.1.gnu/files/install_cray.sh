./configure \
--disable-openmp \
--prefix=/pdc/vol/extrae/3.2.1/cray \
--with-mpi=/opt/cray/mpt/7.2.5/gni/mpich2-cray/8.3/ \
--with-binary-type=64 \
--with-binutils=/pdc/vol/binutils \
--with-papi=/opt/cray/papi/5.4.1.2 \
--with-unwind=/pdc/vol/libunwind \
--disable-xmltest \
--without-dyninst \
CC=cc CXX=CC F77=ftn  MPICC=cc

