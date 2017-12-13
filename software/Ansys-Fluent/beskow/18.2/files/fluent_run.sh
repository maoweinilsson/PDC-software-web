#!/bin/bash -l

# The name of the script is myjob
#SBATCH -J myjob

# The wall-clock time will be given to this job
#SBATCH -t 24:00:00

# Scaina time allocation (project)
#SBATCH -A 2017-1-xx

# Number of nodes
#SBATCH -N 8

#SBATCH -e error_file.e.%J
#SBATCH -o output_file.o.%J

# load the intel compiler
module sw PrgEnv-cray PrgEnv-gnu

# load module fluent v18.2
module add fluent/18.2 

# Set some variables for cray systems
export FLUENT_ARCH=lnamd64

export LD_LIBRARY_PATH=$PWD:$LD_LIBRARY_PATH:$CRAY_LD_LIBRARY_PATH

export FLUENT_ALPS_HOST_ON_COMPUTE=1

export FLUENT_CRAY_MPI_ABI=1

# Set the license server below
#

# The Journal file
JOURNALFILE=test.jou

export FLUENT_MPIRUN_FLAGS="-N32 "

# Total number of Processors
# NPROCS=256=8x32 = number of nodes x number of processors per node
NPROCS=256

# Run fluent command 
fluent 3ddp -gu -driver null -nmon -mpi=cray -t $NPROCS -i $JOURNALFILE  > fluent_beskow.$SLURM_JOBID.log

