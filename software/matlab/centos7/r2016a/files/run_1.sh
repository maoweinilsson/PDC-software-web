#!/bin/bash -l
#SBATCH -A 201X-X-XX      
#SBATCH -J myjob                              
#SBATCH -t 0:05:00                                 
#SBATCH --nodes=1                              
#SBATCH -e error_file.e                             
#SBATCH -o output_file.o

module add matlab/r2016a
# Run matlab taking your_matlab_program.m as input and show the output in the file
# your_matlab_program.out. The input file must be in the directory where you submit this script. 
# This is also where the output will be created.

matlab -nosplash -nodesktop -nodisplay < your_matlab_program.m > your_matlab_program.out

# If you remove the part:
# > your_matlab_program.out
# the output will instead be shown in the file output_file.o specified above
