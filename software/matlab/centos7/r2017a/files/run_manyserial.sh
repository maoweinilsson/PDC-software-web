#!/bin/bash -l
#SBATCH -A 201X-X-XX      
#SBATCH -J myjob                              
#SBATCH -t 0:05:00                                 
#SBATCH --nodes=1                              
#SBATCH -e error_file.e                             
#SBATCH -o output_file.o

module add matlab/r2017a
# Run matlab for 24 individual programs serial_program_1.m, 
# serial_program_2.m ... and print output in files logfile_1, logfile_2, ...
# The input files must be in the directory where you submit this script. 
# This is also where the output will be created.

for i in {1..24} ; do
    matlab -nosplash -nodesktop -nodisplay < serial_program_${i}.m > logfile_$i &
done
# this wait command must be present since otherwise the job will terminate immediately
wait  

