#!/bin/sh

# load the gams module
module load gams/23.7.3
# run the job
gams inputfile.gms > outputfile.lst
