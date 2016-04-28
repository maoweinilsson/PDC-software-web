Information on how to build and install GCC can be found at https://gcc.gnu.org/wiki/InstallingGCC
In order to work GCC is dependent on the following libraries which must be installed
and this installation was performed using these...

==== =====
gmp  6.1.0
mpc  1.0.3
mpfr 3.1.4
==== =====

#. download GCC from https://ftp.gnu.org/gnu/gcc/gcc-5.3.0/

::

  $ make [build]
  $ cd [build]
  $ module add gcc/5.1
  $ [source]/configure --with-mpfr=/pdc/vol/mpfr/3.1.4 --with-gmp=/pdc/vol/gmp/6.1.0 --with-mpc=/pdc/vol/mpc/1.0.3 --disable-checking --enable-languages=c,c++,fortran --disable-multilib --with-system-zlib prefix=/pdc/vol/gcc/5.3.0/amd64_co7
  $ make
  $ make install
