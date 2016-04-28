#!/bin/bash -l

#The name of the script is mytest
#SBATCH -J mytest

# 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# set the project to be charged for this
# should normally be of the format 2015-1 or 2015-16-1 or similar
#SBATCH -A 2015-1

# Number of nodes
#SBATCH --nodes=2
# Number of MPI processes per node (24 is recommended for most cases)
# 48 is the default to allow the possibility of hyperthreading
#SBATCH --ntasks-per-node=24
# Number of MPI processes.

# Load the elmer module
module load elmer/a450ffc-gnu

# Start the Elmer job
echo stokes.sif > ELMERSOLVER_STARTINFO 
mpirun -n 48 ElmerSolver_mpi  > output.${SLURM_JOBID}  2>&1

