

Configuring and compiling
-------------------------

Built on the compute nodes to avoid cross compiling, also as it does
not contain MPI instructions, built using normal compilers, not the 
cray compiler wrappers

GNU
---

.. code-block:: bash

  module swap PrgEnv-cray PrgEnv-gnu
  export CC=gcc
  export FC=gfortran
  export CFLAGS="-fPIC -O3"
  export FFLAGS="-fPIC -O3"

  aprun -n 1 -b ./configure --prefix=/pdc/vol/libxc/2.0.1/GNU/49 --enable-shared 
  aprun -b -n 1 -d 32 make -j 32


Intel
-----

.. code-block:: bash
 
  module swap PrgEnv-cray PrgEnv-intel
  export CC=icc
  export FC=ifort
  export CFLAGS="-fPIC -O3"
  export FFLAGS="-fPIC -O3"

  aprun -n 1 -b ./configure --prefix=/pdc/vol/libxc/2.0.1/INTEL/140 --enable-shared 
  aprun -b -n 1 -d 32 make -j 32

