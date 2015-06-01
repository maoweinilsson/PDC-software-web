#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A 2014-11-24

# The name of the script is myjob
#SBATCH -J jet_crf

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 0:30:00

# Number of nodes
#SBATCH --nodes 8
# Number of MPI processes per node (the following is actually the default)
#SBATCH --ntasks-per-node=32
# Number of MPI processes.
#SBATCH -n 256
#SBATCH --exclusive 

#SBATCH -e error_file.e
#SBATCH -o output_file.o

casename='jet_crf'
echo $casename > SESSION.NAME
echo `pwd`'/' >> SESSION.NAME
# Run the executable  
aprun -n 256 ./nek5000 > $casename.log 2>&1
