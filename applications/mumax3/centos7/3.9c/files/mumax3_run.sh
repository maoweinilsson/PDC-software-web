#!/bin/bash 

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH --nodes=1

# Request the node with Tesla K80 GPU
#SBATCH -C Haswell --gres=gpu:K80:2

# Output and error files
#SBATCH -e error_file.e
#SBATCH -o output_file.o

# load module mumax3
module add mumax3/3.9c

# Run mumax3
mumax3 myfile.mx3

