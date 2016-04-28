
The sourcefiles can be downloaded from https://gmplib.org/

Can be downloaded from http://www.mpfr.org/mpfr-current/#download
To compile mpfr you need the GMP library

::
 
  $ module add gcc/5.1
  $ configure prefix=build --with-gmp=/pdc/vol/gmp/6.1.0
  $ make
  $ make install
