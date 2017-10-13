#!/bin/bash 

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH -N 2

# Number of MPI processes per node 
###SBATCH --ntasks-per-node=24

#SBATCH -e error_file.e
#SBATCH -o output_file.o

# load module fluent v18.2
module add fluent/18.2 

# The Journal file
JOURNALFILE=mycase.jou

# Total number of Processors
#NPROCS=24
NTASKS=`echo $SLURM_TASKS_PER_NODE | cut -c1-2`
NPROCS=`expr $SLURM_NNODES \* $NTASKS`

if [ $SLURM_NNODES -eq 1 ]; then
    # Single node with shared memory
    fluent 3ddp -g -t $NPROCS -i $JOURNALFILE > fluent.log 
else
    # Multi-node
    fluent 3ddp -g -slurm -t $NPROCS -mpi=ibmmpi -pib -i $JOURNALFILE > fluent.log 
fi

