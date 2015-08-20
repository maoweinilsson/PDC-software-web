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

#srun comsol -nn 2  batch -inputfile  Theim_example_1D_2D_and_3D.mph -outputfile output5.mesh -batchlog batchlog2.txt

# Run comsol on the multi-node
srun hostname  |  sort |  uniq > nodes.comsol &
srun comsol -nn 2 -np 24  batch -f ./nodes.comsol -inputfile  input.mph -outputfile output.mesh -batchlog batchlog.txt


