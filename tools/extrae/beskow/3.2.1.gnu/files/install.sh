./configure MPICC=cc \
--with-mpi=/opt/cray/mpt/7.2.5/gni/mpich2-gnu/49 \
--with-binary-type=64 \
--enable-openmp \
--with-binutils=/pdc/vol/binutils \
--with-papi=/opt/cray/papi/5.3.2 \
--with-unwind=/pdc/vol/libunwind \
--prefix=/pdc/vol/extrae/3.2.1/gnu \
--disable-xmltest \
--without-dyninst CC=cc CXX=CC F77=ftn

