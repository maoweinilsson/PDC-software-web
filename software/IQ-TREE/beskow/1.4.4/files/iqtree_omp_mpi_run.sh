#!/bin/bash -l
# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of MPI tasks.
#SBATCH -n 20

# Number of nodes
#SBATCH -N 10

# Number of MPI tasks per node
#SBATCH --ntasks-per-node=2

#SBATCH -e error_file.e
#SBATCH -o output_file.o

export OMP_NUM_THREADS=16

# Load the module
module add iqtree/1.4.4

# Run the executable  
aprun -n 20 -N 2 -d 16 -cc none iqtree-omp-mpi  -nt 16 -s example.phy

