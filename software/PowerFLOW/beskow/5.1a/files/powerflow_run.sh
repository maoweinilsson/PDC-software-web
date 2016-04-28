#!/bin/bash -l 

#SBATCH -J mytest

# The jobID it needs to wait completion 
###SBATCH  --dependency=246589:246590

# wall-clock time will be given to this job
#SBATCH -t 1:59:00

# Number of nodes to be allocated is (NPROCS/32)+1
#SBATCH --nodes 2

# Number of MPI processes per node (default 32)
#SBATCH --ntasks-per-node=32

### Output and error files
#SBATCH -e error_file.e%J
#SBATCH -o output_file.o%J

###########################################

# Number of cores for simulation 
export NPROCS=32

# Number of timesteps
export NUM_TIMESTEPS=1000

module add powerflow/5.1a

# Not sure the environment variables still used for intel haswell
export MALLOC_TRIM_THRESHOLD_=-1
export MALLOC_MMAP_MAX_=0

exawatcher > watcher_sim_$SLURM_JOBID.o &
exaqsub -xe6_decomp -decompose -decomp_log decompose_$SLURM_JOBID.o -xe6 -foreground -simulate -sim_log simulator_$SLURM_JOBID.o -nprocs $NPROCS -num_timesteps $NUM_TIMESTEPS -simoption "-checkpoint 1450000" *.cdi

