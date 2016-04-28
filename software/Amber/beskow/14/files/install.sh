#!/bin/bash --login

#SBATCH -A pdc.staff
#SBATCH -J build-amber
#SBATCH -t 00:59:00
#SBATCH --nodes 1
#SBATCH -o stdout.txt
#SBATCH -e stderr.txt

# here we will install Amber 14 with AmberTools 14

# we load the following modules:
module swap PrgEnv-cray PrgEnv-gnu
module add cray-hdf5-parallel/1.8.14
module add cray-netcdf-hdf5parallel/4.3.3.1
module add fftw/3.3.4.5

# extract files and set amberhome:
cd /pdc/vol/amber/14
tar jxvf src/AmberTools14.tar.bz2
tar jxvf src/Amber14.tar.bz2
cd amber14
export AMBERHOME=/pdc/vol/amber/14/amber14

# first we need to upgrade ambertools 10 version 15
# the updater is intentionally run twice
yes | ./update_amber --upgrade
yes | ./update_amber --upgrade

# need to remove --shared option from fftw build configuration manually
# the file ambertools14.patch is in the rst documentation files/ folder
# place a copy in /pdc/vol/amber/14 and apply it:

patch -p1 < ../ambertools14.patch

# we first build the mpi version
# the code has to be built on a compute node otherwise it does not compile
# we configure piping yes so that all patches get applied
yes | ./configure -static -mpi -noX11 -nomtkpp -crayxt5 --with-netcdf /opt/cray/netcdf-hdf5parallel/4.3.3.1/gnu/4.9 gnu
aprun -n 1 -d 32 make install -j32
# then the serial build
yes | ./configure -static      -noX11 -nomtkpp -crayxt5 --with-netcdf /opt/cray/netcdf-hdf5parallel/4.3.3.1/gnu/4.9 gnu
aprun -n 1 -d 32 make install -j32
