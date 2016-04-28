On Tegner we recommend compiling GROMACS with the GNU compilers and IntelMPI.
But we first need to build Plumed::

  $ module add gcc/4.8.4
  $ module add intelmpi/5.0.3
  $ tar xvfz plumed-2.2.1.tgz
  $ cd plumed
  $ ./configure --prefix=/pdc/vol/plumed/2.2.1/amd64_co7/ --enable-mpi
  $ make -j 4 install

Check that it runs::

  $ /pdc/vol/plumed/2.2.1/amd64_co7/bin/plumed -h

Now fetch GROMACS::

  $ cd /afs/.pdc.kth.se/pdc/vol/gromacs/4.6.7-plumed_2.2.1/src/
  $ wget ftp://ftp.gromacs.org/pub/gromacs/gromacs-4.6.7.tar.gz
  $ tar xfvz gromacs-4.6.7.tar.gz

First patch the GROMACS source by::
  
  $ cd gromacs-4.6.7
  $ /pdc/vol/plumed/2.2.1/amd64_co7/bin/plumed-patch -p

And then proceed with building the usual way::

  $ mkdir ../build
  $ cd ../build
  $ module add gcc/4.8.4
  $ module add intelmpi/5.0.3
  $ module load fftw/3.3.4-gcc-8.4-intelmpi-5.0.3-single
  $ module add cuda/7.0
  $ module add cmake/3.1.3
  $ module add git/2.3.0

Single precision with GPU support::

  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/4.6.7-plumed_2.2.1/amd64_co7 -DGMX_GPU=ON -DCUDA_TOOLKIT_ROOT_DIR=/pdc/vol/cuda/cuda-7.0 -DGMX_MPI=ON -DGMX_BUILD_OWN_FFTW=ON -DGMX_DOUBLE=OFF -DCMAKE_CXX_COMPILER=mpicxx -DCMAKE_C_COMPILER=mpicc ../gromacs-4.6.7

Double precision without GPU support::
  $ cmake -DCMAKE_INSTALL_PREFIX=/pdc/vol/gromacs/4.6.7-plumed_2.2.1/amd64_co7 -DGMX_GPU=OFF -DGMX_MPI=ON -DGMX_BUILD_OWN_FFTW=ON -DGMX_DOUBLE=ON -DCMAKE_CXX_COMPILER=mpicxx -DCMAKE_C_COMPILER=mpicc ../gromacs-4.6.7

