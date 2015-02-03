#!/bin/bash
script="$0"

module add easy heimdal ansys/14.5

# cfx.sh
#
# Usage: esubmit -n<nodes> -t<min> -c <my_CAC> ./cfx.sh pdc_cfx_test.def <count>
# Note: if the count is not specified, the partition file should be stored
#       in the same directory 
#

if [ $# -eq 2 ]
then
 echo "Start to do partition "
 echo cfx5solve -def $1 -par-local -partition $2 
 cfx5solve -def $1 -par-local  -partition $2
else
 parfile=`echo $1 | sed 's/.def/.par/'`
 echo "Start to read the partition File" 
 echo cfx5solve -def $1 -par-local -parfile-read $parfile 
 cfx5solve -def $1 -par-local  -parfile-read $parfile    
fi

echo ""
echo "Program ran to completion at `date`"

