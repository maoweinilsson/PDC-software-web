#!/bin/bash 

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH --nodes=1

# Output and error files
#SBATCH -e error_file.e
#SBATCH -o output_file.o

# load module gerris
module add gerris/20131206

# Run gerris command
gerris2D test.gfs


