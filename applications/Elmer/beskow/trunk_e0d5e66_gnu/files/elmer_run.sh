#!/bin/bash -l

#The name of the script is mytest
#SBATCH -J mytest

# 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH --nodes=4

# Number of MPI processes per node (default 32)
#SBATCH --ntasks-per-node=32

# Number of cores to be allocated is 128
NCORES=128

# Swap to PrgEnv-gnu (required for elmer to work)
module swap PrgEnv-cray PrgEnv-gnu

# Load the elmer module
module load elmer/trunk_e0d5e66_gnu

# Start the Elmer job
echo stokes.sif > ELMERSOLVER_STARTINFO 
aprun -n 128 ElmerSolver_mpi  > output.${SLURM_JOBID}  2>&1

