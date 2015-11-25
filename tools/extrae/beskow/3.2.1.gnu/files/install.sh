./configure MPICC=cc \
--with-mpi=/opt/cray/mpt/7.0.4/gni/mpich2-gnu/49 \
--with-binary-type=64 \
--enable-openmp \
--with-binutils=$BINUTILS_DIR \
--with-papi=/opt/cray/papi/5.3.2 \
--with-unwind=$LIBUNWIND_DIR \
--prefix=/pdc/vol/extrae/3.2.1/gnu \
--disable-xmltest \
--disable-shared \
--enable-static \
--without-dyninst CC=cc CXX=CC F77=ftn

