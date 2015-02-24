:orphan:

.. include:: building.inc

According to the online manual the software should be
compiled with GNU CC, but compilation/running works
with the intel compiler as well

$ module swap PrgEnv-cray PrgEnv-intel
$ cd sources

change the Makefile so that CC=CC

$ make

binaries are created in the data directory.
A bin directory was created and executable files in the data
directory where symbolically linked from the bin directory.


