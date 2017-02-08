#!/bin/bash 

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 01:00:00

# set the project to be charged for this
# should normally be of the format 2017-1 or 2017-17-1 or similar
#SBATCH -A 2017-1

# Number of nodes
#SBATCH --nodes=2

#SBATCH -e error_file.e
#SBATCH -o output_file.o
 
# Load the AVL fire module
module load fire/2013.0

# Set the number of cores 
ncpus=48

# Adapt the name of nodes for AVL Fire
srun hostname  |  sort |  uniq > nodelist
export hosts=`hostconvert_fire_tegner.pl nodelist`

# Run the fire command
fire_cmd -name=fire -no_file_locking -nomapping -mpi -cpu=$ncpus -hostlist=$hosts -project_dir=$PWD -case=Case -solver_vers=v2013

