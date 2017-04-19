

Using gcc to to build dynamically and avoid complications with wrapper scripts etc.

Building on the login node::

  module add gcc
  ./configure --with-f77=gfortran --prefix=/pdc/vol/grace/5.1.25/


This builds without fftw support (likely not needed).

