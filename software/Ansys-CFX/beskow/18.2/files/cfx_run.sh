#!/bin/bash -l
# The -l above is required to get the full environment with modules

# The name of the script is myjob
#SBATCH -J myjob

# The wall-clock time will be given to this job
#SBATCH -t 24:00:00

# The time allocation (project)
#SBATCH -A 2017-1-xx

# Number of nodes
#SBATCH -N 8

#SBATCH -e error_file.e%J
#SBATCH -o output_file.o%J

## Load the ansys/cfx v18.2 module 
module add ansys/18.2

# Load modules and environment variables
module swap PrgEnv-cray PrgEnv-intel
#module swap gcc gcc/5.1.0
module load cray-mpich-abi
export MPICH_VERSION_DISPLAY=1

# Set the license server below

# The Input file
DEF_FILE=Benchmark.def

# The number of partition
# NUM_PART = number_of_nodes*number_of_cores_per_node
# in this case 8*32=256
NUM_PART=256

# Run the cfx 
echo "Start to do simulation "

# NOTICE: the partition file should be created on Tegner or local computer 
#         using flag -part-only (cfx5solve -def $DEF_FILE -part-only $NUM_PART)
cfx5solve -def $DEF_FILE  -parfile-read Benchmark.par -start-method "Cray MPI Distributed Parallel"

echo ""
echo "Program ran to completion at `date`"

