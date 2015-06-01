#!/bin/bash -l

#The name of the script is mytest
#SBATCH -J mytest

# 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH --nodes 16

# Number of MPI processes per node (default 32)
#SBATCH --ntasks-per-node=32

# Number of cores to be allocated is 512
NCORES=512

# Swap to PrgEnv-gnu (required for openfoam to work)
module swap PrgEnv-cray PrgEnv-gnu

# Load the openfoam module
module load openfoam/2.1.0

# Set the openfoam environment variables
. $FOAM_BASHRC

# Start the OpenFOAM job
aprun -n $NCORES icoFoam -parallel > my_output_file 2>&1

