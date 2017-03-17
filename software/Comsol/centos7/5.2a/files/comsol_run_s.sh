#!/bin/bash

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# set the project to be charged for this
# should normally be of the format 2017-1 or 2017-17-1 or similar
#SBATCH -A 2017-1

# Number of nodes
#SBATCH --nodes=1

# Number of MPI processes per node (24 is recommended for most cases)
# 48 is the default to allow the possibility of hyperthreading
#SBATCH --ntasks-per-node=24

#SBATCH -e error_file.e
#SBATCH -o output_file.o

# load comsol module
module add comsol/5.2a

# Run the comsol
comsol batch -inputfile  input.mph -outputfile output.mph -batchlog batchlog.txt

