

Compiling Dalton 2013.3 on Lindgren
===================================

First load the Intel environment and CMake::

  $ module swap PrgEnv-pgi PrgEnv-intel
  $ module add cmake

Then extract the tarball and configure Dalton for CRAY::

  $ ./setup --fc=ftn --cc=cc --cxx=CC --cray --mpi --omp --scalapack build_lindgren

Then build both the dalton.x and lsdalton.x binaries::

  $ cd build_lindgren
  $ make

For more information see: http://daltonprogram.org/installation/2013/


Disclaimer
==========

PDC takes no responsibility for the correctness of results produced with the
binaries. We have ran the test set after installation but a number of tests
fail (see below). Hence, always evaluate the binaries against known results for
the systems and properties you are investigating before using the binaries for
production jobs.


Failed DALTON tests on Lindgren (dalton/2013.2)
===============================================

- dft_disp_d2


Failed LSDALTON tests on Lindgren (dalton/2013.2)
=================================================

- LSlib/LSlib_cam_reg
- LSlib/LSlib_cam_dfJ_aK
