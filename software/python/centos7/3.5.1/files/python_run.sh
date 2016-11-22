#!/bin/bash 

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH -N 1

# Number of MPI processes per node 
##SBATCH --ntasks-per-node=24

#SBATCH -e error_file.e
#SBATCH -o output_file.o

module load anaconda/py35/2.4.1

# put these lines immediately before aprun
source $LOCAL_ANACONDA/bin/activate $LOCAL_ANACONDA
export ANACONDA_HOME=$LOCAL_ANACONDA
source activate_python

# execute the program
python ./anacondatest.py

# put this line immediately after aprun
source deactivate_python


