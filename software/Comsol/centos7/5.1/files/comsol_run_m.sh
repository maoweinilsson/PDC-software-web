#!/bin/bash

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH --nodes=2

#SBATCH -e error_file.e
#SBATCH -o output_file.o

# load comsol module
module add comsol/5.1

# Run comsol on the multi-node
srun hostname  |  sort |  uniq > nodes.comsol 
comsol -nn 2 -np 24  batch -f ./nodes.comsol -inputfile  input.mph -outputfile output.mph -batchlog batchlog.txt


