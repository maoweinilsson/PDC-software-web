#!/bin/bash -l

# The name of the script is myjob
#SBATCH -J myjob

# Recive email notifications with any state change
#SBATCH --mail-type=ALL

# 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH --nodes=3

# Number of MPI processes per node (the following is actually the default)
#SBATCH --ntasks-per-node=32
# Number of MPI processes.
#SBATCH -n 96

# Output and error files
#SBATCH -e error_file.e%J
#SBATCH -o output_file.o%J

# starccm+ v11.04.010 single precision
module load starccm+/11.04.010-sp

sim_file="input.sim"

STARTMACRO="./benchmark.java"
LETTER=`echo $USER | cut -c1`
LUSTRE_ROOT=/cfs/klemming/nobackup/$LETTER/$USER/StarCCM_config

# Set the temporary path
export TMPDIR=/cfs/klemming/nobackup/$LETTER/$USER

STARTMACRO=${STARTMACRO:+"-batch $STARTMACRO"}

# Using the POD Key                      
starccm+ -power -podkey f6cP59+o6MaXfV90pgBBcs9//hQ  -licpath 1999@flex.cd-adapco.com -collab -np 96 -pio  $STARTMACRO -batch -arch linux-x86_64-2.5 -mpidriver crayxt -nbuserdir $LUSTRE_ROOT ${sim_file}> starccmRun.$SLURM_JOBID.log 2>&1

# Check out the license from a license server
#export CDLMD_LICENSE_FILE=31411@license-1.pdc.kth.se
#starccm+ -power -collab -np 96 -pio  $STARTMACRO -batch -arch linux-x86_64-2.5 -mpidriver crayxt -nbuserdir $LUSTRE_ROOT ${sim_file}> starccmRun.$SLURM_JOBID.log 2>&1


