#!/bin/bash
# Add the matlab software version:
module add matlab/r2013b

NOBACKUP=/cfs/zorn/nobackup/${USER:0:1}/$USER

#  Go to the work directory where you have your Matlab program:
cd $PBS_WORK_DIR

# needed on some systems
unset DISPLAY

# Run matlab taking your_matlab_program.m as input and show the output in the file
# your_matlab_program.out. The input file must be in the directory specified above. 
# This is also where the output will be created. Set the $HOME variable to to your
# nobackup directory.

HOME=$NOBACKUP matlab -nojvm -nodesktop < your_matlab_program.m > your_matlab_program.out

# If you remove the part:
# > your_matlab_program.out
# the output will instead be shown in the e-mail which the queue system will send you.
