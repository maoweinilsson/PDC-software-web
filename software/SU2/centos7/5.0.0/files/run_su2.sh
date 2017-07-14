#!/bin/bash 

# Set the allocation to be charged for this job
# not required if you have set a default allocation

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# set the project to be charged for this
# should normally be of the format 2017-1 or 2017-16-1 or similar
#SBATCH -A 2017-1

# Number of nodes
#SBATCH --nodes=2

# Number of MPI processes per node
#SBATCH --ntasks-per-node=24

#SBATCH -e error_file.e
#SBATCH -o output_file.o
 
# load the su2 modules
module load su2/5.0.0 
 
# Run the executable SU2_CFD
mpirun -np 48 SU2_CFD inv_NACA0012.cfg

