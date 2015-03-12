

using gcc to to build dynamically and avoid complications with wrapper scripts etc.

Building on the login node::

  module add gcc
  ./configure --with-f77=gfortran --prefix=/pdc/vol/grace/5.1.23/


This builds without fftw support (likely not needed, but who knows)

For some reason it makes an extra grace directory in the tree, trying to take that
out breaks somethign as some paths seem to be hard coded
