#!/bin/bash 

# The name of the script is myjob
#SBATCH -J mytest

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 01:00:00

# Number of nodes
#SBATCH -N 1

# Number of MPI processes per node 
##SBATCH --ntasks-per-node=24

# Number of MPI processes.
##SBATCH -n 8

#SBATCH -e error_file.e%J
#SBATCH -o output_file.o%J

# Load the ansys/cfx v16.0 module 
module add ansys/16.0

# The Input file
DEF_FILE=Benchmark.def

# The number of partition
#NUM_PART=24
NUM_PART=`expr $SLURM_NNODES \* $SLURM_TASKS_PER_NODE`

if [ $SLURM_NNODES -eq 1 ]; then
    # Single node with shared memory
    cfx5solve -def $DEF_FILE -start-method "Intel MPI Local Parallel" -par-local -partition $NUM_PART > cfx5.log 2>&1
fi
