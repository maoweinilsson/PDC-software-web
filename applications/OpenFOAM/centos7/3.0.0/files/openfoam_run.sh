#!/bin/bash 

#The name of the script is mytest
#SBATCH -J mytest

# 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Set the project to be charged for this
# should normally be of the format 2015-XX or 2015-10-XX or similar
#SBATCH -A 2015-XX

# Number of nodes
#SBATCH --nodes=2

# Number of cores to be allocated is 48
NCORES=48

# Load the openfoam module
module load openfoam/3.0.0

# Set the openfoam environment variables
. $FOAM_BASHRC

# Start the OpenFOAM job
mpirun -n $NCORES icoFoam -parallel > my_output_file 2>&1


