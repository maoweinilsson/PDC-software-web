#!/bin/sh

# load the gams module
module load gams
# run the job
gams inputfile.gms > outputfile.lst
