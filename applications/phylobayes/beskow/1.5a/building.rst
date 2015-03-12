

According to the online manual the software should be
compiled with GNU CC, but compilation/running works
with the intel compiler as well.

First::

  $ module swap PrgEnv-cray PrgEnv-intel
  $ cd sources

change the Makefile so that ``CC=CC``
Then build::

  $ make

binaries are created in the data directory.
A bin directory was created::

  $ cd ..
  $ mkdir bin
  $ cd bin

symlinks were created for all executable files in the data directory.

