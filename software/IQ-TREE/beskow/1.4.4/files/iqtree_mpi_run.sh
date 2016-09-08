#!/bin/bash -l
# The -l above is required to get the full environment with modules

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH -N 10
# Number of MPI processes per node (the following is actually the default)
##SBATCH --ntasks-per-node=32

#SBATCH -e error_file.e
#SBATCH -o output_file.o

# load the module
module add iqtree/1.4.4

# Run the executable  
# and write the output into my_output_file
aprun -n 320 iqtree-mpi -s example.phy 

