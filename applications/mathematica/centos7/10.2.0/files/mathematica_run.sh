#!/bin/bash

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH --nodes=1

#SBATCH -e error_file.e
#SBATCH -o output_file.o

# load mathematica module
module add mathematica/10.2.0

# Run the mathematica with the text script foo.m
math -script foo.m > output.txt

