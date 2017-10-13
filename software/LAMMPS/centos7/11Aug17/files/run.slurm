#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A 201X-X-XX

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 01:00:00

# Number of nodes
#SBATCH --nodes=1

#SBATCH -e error_file.e
#SBATCH -o output_file.o

# To run on a K80 GPU node:
#SBATCH --gres=gpu:K80:2

#load the lammps module
module add lammps/11Aug17

# Run with the file in.lj as input, output is written to log.lammps by default
# Run using 8 cores and both GPUs (using "-sf gpu" and "-pk gpu 2" which alleviates the need to modify the input file in.lj) 
mpirun -np 8 lmp -sf gpu -pk gpu 2  < in.lj
