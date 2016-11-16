This version is compiled with support for ALMOST (http://www-almost.ch.cam.ac.uk/site/almost.html).

First fetch and build plumed. We do not build it with Almost since this gives compilation problems for Gromacs when adding Plumed support::

  $ tar xvfz plumed-2.3b.tgz
  $ cd plumed
  $ module load gcc/4.8.4
  $ module load intelmpi/5.0.3
  $ module load fftw/3.3.4-gcc-8.4-intelmpi-5.0.3-single
  $ export CRAYPE_LINK_TYPE=dynamic
  $ ./configure --prefix=/afs/.pdc.kth.se/pdc/vol/plumed/2.3b
  $ make -j 4 install

Check it runs (plumed will now only work on the login node with the --no-mpi option)::

  $ /afs/.pdc.kth.se/pdc/vol/plumed/2.3b/bin/plumed --no-mpi -h

Now build GROMACS with support for plumed. Install in a different directory from vanilla GROMACS.

Use a copy of the GROMACS sources::

  $ mkdir -p /afs/.pdc.kth.se/pdc/vol/gromacs/2016.1-plumed_2.3b/src
  $ cd /afs/.pdc.kth.se/pdc/vol/gromacs/2016.1-plumed_2.3b/src
  $ cp ../../2016.1/src/gromacs-2016.tar.gz .
  $ tar zxf gromacs-2016.tar.gz 
  
First patch the Gromacs source by choosing option 2), gromacs-2016::

  $ /afs/.pdc.kth.se/pdc/vol/plumed/2.3b/bin/plumed-patch -p

Use the same procedure as normally for Gromacs for configuring/building::

  $ mkdir ../build
  $ cd ../build
  $ module add cmake/3.1.3
  $ module add git/2.3.0
  $ module add cuda/7.0
  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/2016.1-plumed_2.3b/amd64_co7/haswell -DGMX_GPU=ON -DGMX_DOUBLE=OFF -DGMX_SIMD=AVX2_256 -DGMX_MPI=ON -DGMX_CYCLE_SUBCOUNTERS=ON -DGMX_PREFER_STATIC_LIBS=ON -DBUILD_SHARED_LIBS=OFF -DGMX_EXTERNAL_BLAS=OFF -DGMX_EXTERNAL_LAPACK=OFF ../gromacs-2016  -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DMPI_C_COMPILER=mpicc -DMPI_CXX_COMPILER=mpicxx -DCMAKE_PREFIX_PATH=/pdc/vol/fftw/3.3.4/gcc/8.4/intelmpi/5.0.3/single -DCUDA_NVCC_FLAGS="-gencode;arch=compute_37,code=sm_37;"

Then install in double precision (GPU not supported in double)::

  $ make clean
  $ cmake -DCMAKE_PREFIX_PATH=/pdc/vol/fftw/3.3.4/gcc/8.4/intelmpi/5.0.3/double -DGMX_DOUBLE=ON -DGMX_SIMD=AVX2_256 -DGMX_GPU=OFF ../gromacs-2016
  $ make -j 8 install

Refer to the Gromacs-2016 documentation for further information: https://www.pdc.kth.se/software
