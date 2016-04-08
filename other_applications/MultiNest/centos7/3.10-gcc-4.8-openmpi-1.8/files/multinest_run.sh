#!/bin/bash 

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH --nodes=2

# Output and error files
#SBATCH -e error_file.e
#SBATCH -o output_file.o

# load module multinest
module add multinest/3.10-gcc-4.8-openmpi-1.8 

# Run multinest
mpirun -np 48 eggboxC

