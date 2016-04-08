#!/bin/bash --login

#SBATCH -J build-amber
#SBATCH -t 00:59:00
#SBATCH --nodes 1
#SBATCH -o stdout.txt
#SBATCH -e stderr.txt

# here we will install Amber 12 with AmberTools 13
# for the installation we follow (the latter is for Amber 11):
# http://jswails.wikidot.com/installing-amber12-and-ambertools-13
# http://www.hector.ac.uk/support/documentation/software/amber/compiling-phase3.php

# we load the following modules:
module swap PrgEnv-cray PrgEnv-gnu
module add cray-netcdf/4.3.2
module add fftw/3.3.4.0

# extract files and set amberhome:
cd /pdc/vol/amber/12
tar jxvf src/AmberTools13.tar.bz2
tar jxvf src/Amber12.tar.bz2
cd amber12
export AMBERHOME=/pdc/vol/amber/12/amber12

# we first build the mpi version
# the code has to be built on a compute node otherwise it does not compile
# we configure piping yes so that all patches get applied
yes | ./configure -static -mpi -noX11 -nomtkpp -crayxt5 --with-netcdf /opt/cray/netcdf/4.3.2/gnu/49 gnu
aprun -n 1 -d 32 make install -j32
# then the serial build
yes | ./configure -static      -noX11 -nomtkpp -crayxt5 --with-netcdf /opt/cray/netcdf/4.3.2/gnu/49 gnu
aprun -n 1 -d 32 make install -j32
