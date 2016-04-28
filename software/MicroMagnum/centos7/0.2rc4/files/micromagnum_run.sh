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

# load module micromagnum
module add micromagnum/0.2rc4

# Run micromagnum with GPU
python sp4.py -g0

