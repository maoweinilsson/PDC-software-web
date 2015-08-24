#!/bin/bash 

# The name of the script is myjob
#SBATCH -J mytest

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 01:00:00

# Number of nodes
#SBATCH -N 2

# Number of MPI processes per node 
##SBATCH --ntasks-per-node=24

# Number of MPI processes.
##SBATCH -n 8

#SBATCH -e error_file.e%J
#SBATCH -o output_file.o%J

# Load the ansys/cfx v15.0 module 
module add ansys/15.0

# The Input file
DEF_FILE=Benchmark.def

# The number of partition
#NUM_PART=16
NUM_PART=`expr $SLURM_NNODES \* $SLURM_TASKS_PER_NODE`

if [ $SLURM_NNODES -eq 1 ]; then
    # Single node with shared memory
    cfx5solve -def $DEF_FILE -start-method "Intel MPI Local Parallel" -par-local -partition $NUM_PART > cfx5.log 2>&1
else
    # Multi-node
    NODELIST=`gen_cfx_nodelist.pl`
    cfx5solve -def $DEF_FILE -start-method "Intel MPI Distributed Parallel" -par-dist $NODELIST -partition $NUM_PART > cfx5.log 2>&1    
fi
