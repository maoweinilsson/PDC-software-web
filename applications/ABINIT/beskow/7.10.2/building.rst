

Configuring and compiling
-------------------------

ABINIT is freely available under the GPL license.
http://www.abinit.org/downloads

The code is linked against the Libxc library, and was built on the compute nodes to avoid cross compiling

.. code-block:: bash

  module swap PrgEnv-cray PrgEnv-intel
  module load fftw/3.3.4.0
  aprun -n 1 -b ./configure --enable-mpi --with-linalg-flavor=mkl FC=ftn CC=cc CXX=CC \
              FCFLAGS_EXTRA="-module /pdc/vol/abinit/7.10.2/src/abinit-7.10.2/src/mods" \
              MPI_RUNNER=aprun --prefix=/pdc/vol/abinit/7.10.2 \
              --with-dft-flavor=libxc \
              --with-libxc-incs="-I/pdc/vol/libxc/2.0.1/INTEL/140/include" \
              --with-libxc-libs="-L/pdc/vol/libxc/2.0.1/INTEL/140/lib -lxc" \
              --with-tardir=/pdc/vol/abinit/7.10.2/src/tarfiles \
              --with-fft-flavor=fftw3 2>&1 | tee config_log
  
  aprun -n 1 -cc none make multi multi_nprocs=32
 

Testing the code
----------------

The test-scripts has to be instructed to use aprun instead of mpirun. This is done by creating a file, (:code:`mpi.cfg`) and supplying it to the test script. ::

  [mpi]
  mpi_prefix = /opt/cray/alps/5.2.1-2.0502.9041.11.6.ari/
  mpirun_np = %(mpi_prefix)s/bin/aprun -q -n

Then start the tests with

.. code-block:: bash

  mkdir tmp && cd tmp
  ../tests/runtests.py --force-mpirun -c mpi.cfg -n 32
