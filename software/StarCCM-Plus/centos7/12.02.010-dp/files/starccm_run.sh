#!/bin/bash -l

# The name of the script is myjob
#SBATCH -J myjob

# Recive email notifications with any state change
#SBATCH --mail-type=ALL

# One hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH --nodes=2

# Number of MPI processes per node 
#SBATCH --ntasks-per-node=24

# Total Number of MPI processes.
#SBATCH -n 48

# Output and error files
#SBATCH -e error_file.e%J
#SBATCH -o output_file.o%J

# Load starccm+ v12.02.010 double precision
module load starccm+/12.02.010-dp

sim_file="input.sim"

STARTMACRO="./benchmark.java"
LETTER=`echo $USER | cut -c1`
LUSTRE_ROOT=/cfs/klemming/nobackup/$LETTER/$USER/StarCCM_config

# Set the temporary path
export TMPDIR=/cfs/klemming/nobackup/$LETTER/$USER

STARTMACRO=${STARTMACRO:+"-batch $STARTMACRO"}

# Using the POD Key                      
starccm+ -power -podkey abc123  -licpath 1999@flex.cd-adapco.com -collab -np 48 -pio  $STARTMACRO -batch  -mpidriver intel -nbuserdir $LUSTRE_ROOT ${sim_file}> starccmRun.$SLURM_JOBID.log 2>&1

# Check out the license from a license server
#export CDLMD_LICENSE_FILE=31411@license-1.pdc.kth.se
#starccm+ -power -collab -np 48 -pio  $STARTMACRO -batch -mpidriver intel -nbuserdir $LUSTRE_ROOT ${sim_file}> starccmRun.$SLURM_JOBID.log 2>&1


