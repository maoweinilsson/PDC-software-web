#!/bin/bash 

# Set the allocation to be charged for this job
# not required if you have set a default allocation

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# set the project to be charged for this
# should normally be of the format 2016-1 or 2016-16-1 or similar
#SBATCH -A 2016-1

# Number of nodes
#SBATCH --nodes=4
# Number of MPI processes per node 
#SBATCH --ntasks-per-node=24

# Run on Haswell node 
#SBATCH -C Haswell

#SBATCH -e error_file.e
#SBATCH -o output_file.o
 
# load the module
module load iqtree/1.4.4 
 
# Run iqtree-mpi
 
mpirun -np 96 iqtree-mpi -s example.phy


