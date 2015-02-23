#!/bin/csh -x
#
#PBS -j eo
#PBS -V
#PBS -S /bin/csh
#PBS -m be

# The name of the job
#PBS -N nano 

# The jobID it needs to wait completion (decomposition job & coarse)
##PBS -W depend=afterany:246589.basslet:246590.basslet

# wall-clock time will be given to this job
#PBS -l walltime=00:59:00

# Number of cores to be allocated is NCORES+24, always request full nodes, i.e. mppwidth should normally be a multiple of 24
#PBS -l mppwidth=48

# Number of cores for simulation
setenv NPROCS 24 

# Number of timesteps
setenv NUM_TIMESTEPS 100000 

##############END_USER_EDIT####################

# Change to the work directory
cd $PBS_O_WORKDIR

#enable modules in the queue system
source /opt/modules/default/etc/modules.sh

#load powerflow version 
module load powerflow/5.0b 
setenv EXA_GNI_LMT_PATH enabled
setenv MALLOC_TRIM_THRESHOLD_ -1
setenv MALLOC_MMAP_MAX_ 0

exawatcher > watcher_sim_$PBS_JOBID.o &
exaqsub -xe6_decomp -decompose -decomp_log decompose_$PBS_JOBID.o -xe6 -foreground -simulate -sim_log simulator_$PBS_JOBID.o -nprocs $NPROCS -num_timesteps $NUM_TIMESTEPS -simoption "-checkpoint 1000000" *.cdi
