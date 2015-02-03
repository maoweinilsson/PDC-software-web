#!/bin/bash
script="$0"

module add easy heimdal ansys/14.5

# cfx.sh
#
# Usage: esubmit -n<nodes> -t<min> -c <my_CAC> ./cfx.sh pdc_cfx_test.def numprocs
# Note: The numprocs should be specified. 
#       If the partition file exists in the directory, the partition count
#       should equal to the number of procs

if [ $# -eq 2 ]
then 
 cat $SP_HOSTFILE > tmp.hosts

 # Number of procs per node used
 NPARTS=$(($2/$SP_PROCS))

 # Save the hostfile name
 cat $SP_HOSTFILE | while read line; do echo "$line*$NPARTS"; done > tmp.hosts

 cat tmp.hosts | sort -u | awk '{ printf ",%s", $1; }' | cut -c2- > $SP_JID.hosts

 parfile=`echo $1 | sed 's/.def/.par/'`

 if [ -e $parfile ]
 then
   # partition file exists
   echo "Start to read the partition file "
   echo cfx5solve -def $1 -parfile-read $parfile -par-dist `cat $SP_JID.hosts`
   cfx5solve -def $1 -parfile-read $parfile -par-dist  `cat $SP_JID.hosts`
 else
   echo "Start to do partition "
   echo cfx5solve -def $1 -partition $2 -par-dist `cat $SP_JID.hosts`
   cfx5solve -def $1 -partition $2  -par-dist  `cat $SP_JID.hosts`
 fi
 echo ""
 echo "Program ran to completion at `date`"

else
 echo "Usage: esubmit -n<nodes> -t<min> -c <my_CAC> ./cfx.sh pdc_cfx_test.def numprocs"
fi

echo " "
