#!/bin/bash 

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 01:00:00

# Number of nodes
#SBATCH -N 2

# Number of MPI processes per node 
##SBATCH --ntasks-per-node=24

#SBATCH -e error_file.e%J
#SBATCH -o output_file.o%J

# Load the ansys/cfx v17.2 module 
module add ansys/17.2

# The Input file
DEF_FILE=Benchmark.def

# The number of partition
#NUM_PART=24
NTASKS=`echo $SLURM_TASKS_PER_NODE | cut -c1-2`
NUM_PART=`expr $SLURM_NNODES \* $NTASKS`

if [ $SLURM_NNODES -eq 1 ]; then
    # Single node with shared memory
    cfx5solve -def $DEF_FILE -par-local -partition $NUM_PART > cfx5.log 2>&1
else
    # Multi-node
    NODELIST=`gen_cfx_nodelist.pl`
    cfx5solve -def $DEF_FILE -par-dist $NODELIST -partition $NUM_PART > cfx5.log 2>&1    
fi
