#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A 201X-X-XX

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH --nodes=1
# Number of MPI processes per node 
##SBATCH --ntasks-per-node=32

#SBATCH -e error_file.e
#SBATCH -o output_file.o

# load the anaconda module
module load anaconda/py35/4.2

# if you need the custom conda environment:
source activate custom

# execute the program
aprun -n 1 python ./anacondatest.py

# put this line immediately after aprun
source deactivate


