#!/bin/bash --login

#SBATCH -J build-nwchem

#SBATCH -t 08:00:00

# number of nodes
#SBATCH -N 1

#SBATCH -o stdout.txt
#SBATCH -e stderr.txt

module swap PrgEnv-cray PrgEnv-intel
module load craype-hugepages64M
module load dmapp

# please adapt this path
cd /pdc/vol/nwchem/6.5/build-01/src

# download and extract sources
wget http://www.nwchem-sw.org/download.php?f=Nwchem-6.5.revision26243-src.2014-09-10.tar.gz
tar xvzf Nwchem-6.5.revision26243-src.2014-09-10.tar.gz
mv Nwchem-6.5.revision26243-src.2014-09-10 nwchem-6.5 # NWCHEM_TOP has to be shorter than 60 characters!
cd nwchem-6.5
export NWCHEM_TOP=`pwd`

# further settings
export NWCHEM_TARGET=LINUX64
export USE_MPI=y
export USE_MPIF=y
export USE_MPIF4=y
export LIBMPI=" "
export NWCHEM_MODULES="all"
export USE_NOFSCHECK=TRUE
export USE_NOIO=TRUE
export MRCC_THEORY=TRUE
export BLASOPT=" "
export USE_SCALAPACK=y
export SCALAPACK=" "
export USE_64TO32=y
export ARMCI_NETWORK=DMAPP
export BLAS_LIB=" "
export LAPACK_LIB=" "

# replace ga-5-3 with ga/armci developed by cray folks
cd $NWCHEM_TOP/src/tools
wget https://github.com/ryanolson/ga/archive/cray.zip -O cray.zip
unzip cray.zip

cd $NWCHEM_TOP/src
aprun -n 1 -d 1 make nwchem_config
aprun -n 1 -d 1 make 64_to_32

# workaround for ga-cray not finding dmapp
export LD_LIBRARY_PATH=/opt/cray/dmapp/7.0.1-1.0502.9501.5.219.ari/lib64:$LD_LIBRARY_PATH
export C_INCLUDE_PATH=/opt/cray/dmapp/7.0.1-1.0502.9501.5.219.ari/include:$C_INCLUDE_PATH

cd $NWCHEM_TOP/src/tools
aprun -n 1 -d 1 make FC=ftn GA_DIR=ga-cray

cd $NWCHEM_TOP/src
aprun -n 1 -d 1 make FC=ftn GA_DIR=ga-cray
