#!/bin/bash 

# Set the allocation to be charged for this job
# not required if you have set a default allocation

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# set the project to be charged for this
# should normally be of the format 2015-1 or 2015-16-1 or similar
#SBATCH -A pdc.staff

# Number of nodes
#SBATCH --nodes=1

#SBATCH -e error_file.e
#SBATCH -o output_file.o
 
# load the intel mpi modules
module add sage/7.0
 
# Run the executable sage 
# and write the output into my_output_file
sage <  generate_initial_data.sage > my_output_file 2>&1


