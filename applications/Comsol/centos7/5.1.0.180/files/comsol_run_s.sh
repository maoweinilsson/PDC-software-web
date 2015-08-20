#!/bin/bash

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH --nodes=1

#SBATCH -e error_file.e
#SBATCH -o output_file.o

# load comsol module
module add comsol/5.1.0.180

# Run the comsol
srun comsol -clustersimple  batch -inputfile  input.mph -outputfile output.mesh -batchlog batchlog.txt

