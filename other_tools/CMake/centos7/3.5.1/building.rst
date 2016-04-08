
cmake was installed by using previosly installed cmake executable.

The source files were downloaded from https://cmake.org/download/

::

  $ cd [src]
  $ module add cmake
  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/cmake/3.5.1/amd64_co7 .
  $ make
  $ make install

More detailed instructions on how to install cmake can be found at https://cmake.org/install/
