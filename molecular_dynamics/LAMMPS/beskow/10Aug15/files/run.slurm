#!/bin/bash -l
# The -l above is required to get the full environment with modules

# Set the allocation to be charged for this job
# not required if you have set a default allocation
#SBATCH -A 201X-X-XX

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 24:00:00

# Number of nodes
#SBATCH --nodes=10
# Number of MPI processes per node (the following is actually the default)
#SBATCH --ntasks-per-node=32

#SBATCH -e error_file.e
#SBATCH -o output_file.o


#load the lammps module
module add lammps/10Aug15

# Run with the file infile as input and write to outfile
aprun -n 320 lmp < infile > outfile
