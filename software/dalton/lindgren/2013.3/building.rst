:orphan:


.. include:: building.inc

First load the Intel environment and CMake::

  $ module swap PrgEnv-pgi PrgEnv-intel
  $ module add cmake

Then extract the tarball and configure Dalton for CRAY::

  $ ./setup --fc=ftn --cc=cc --cxx=CC --cray --mpi --omp --scalapack build_lindgren

Then build both the dalton.x and lsdalton.x binaries::

  $ cd build_lindgren
  $ make

For more information see: http://daltonprogram.org/installation/2013/


Failed Dalton tests
-------------------

- dft_disp_d2


Failed LSDalton tests
---------------------

- LSlib/LSlib_cam_reg
- LSlib/LSlib_cam_dfJ_aK
