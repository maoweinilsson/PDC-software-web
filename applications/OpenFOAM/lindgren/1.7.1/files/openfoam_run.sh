# The name of the script is myjob
#!/bin/bash

#PBS -N myjob

# Only 1 hour wall-clock time will be given to this job
#PBS -l walltime=1:00:00

# Number of cores to be allocated is 288.
# always request full nodes, i.e. mppwidth should normally be a multiple of 24
#PBS -l mppwidth=288

# Change to the work directory
cd $PBS_O_WORKDIR

# Enable modules in the queue system
. /opt/modules/default/etc/modules.sh

#swap to PrgEnv-gnu (required for openfoam to work)
module swap PrgEnv-pgi PrgEnv-gnu

# load the openfoam module
module load openfoam/1.7.1

#set the openfoam environment variables
. $FOAM_BASHRC

# Start the OpenFOAM job
aprun -n 288 icoFoam -parallel > my_output_file 2>&1

