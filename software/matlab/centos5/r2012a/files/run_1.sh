#!/bin/bash
# Add the matlab software version:
module add matlab/latest

#  Go to the directory (here Private) where you have your Matlab program:
cd ~/Private/

# needed on some systems
unset DISPLAY

# Run matlab taking your_matlab_program.m as input and show the output in the file
# your_matlab_program.out. The input file must be in the directory specified above. 
# This is also where the output will be created.

matlab -nojvm -nosplash -nodesktop -nodisplay < your_matlab_program.m > your_matlab_program.out

# If you remove the part:
# > your_matlab_program.out
# the output will instead be shown in the e-mail which the queue system will send you.
