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
#SBATCH --nodes=2
# Number of MPI processes per node (24 is recommended for most cases)
# 48 is the default to allow the possibility of hyperthreading
#SBATCH --ntasks-per-node=24
# Number of MPI processes.

#SBATCH -e error_file.e
#SBATCH -o output_file.o

# load the intel mpi modules
module load gcc/5.1
module load openmpi/1.10-gcc-5.1

# Run the executable named myexe
# and write the output into my_output_file
mpirun -np 48 ./myexe > my_output_file 

