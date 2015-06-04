::

 wget ftp://ftp.fftw.org/pub/fftw/fftw-3.3.4.tar.gz

 module add i-compilers/15.0.2 intelmpi/5.0.3

 export CC=icc
 export F77=ifort
 export MPICC=mpiicc

 ./fftw-3.3.4/configure  --enable-mpi --enable-shared --enable-openmp --prefix=/pdc/vol/fftw/3.3.4/intel/15.0.2/intelmpi/5.0.3/double
 make -j 8 install
 make clean
 ./fftw-3.3.4/configure  --enable-mpi --enable-shared --enable-openmp --prefix=/pdc/vol/fftw/3.3.4/intel/15.0.2/intelmpi/5.0.3/single --enable-single
 make -j 8 install
 
