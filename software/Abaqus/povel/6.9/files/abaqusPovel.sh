#!/bin/bash
#Add the software
module add easy abaqus heimdal
#Read how many cores to use on the node
ncpus=$1
#Read what the input file is called
inputFile="$2"
envFile=abaqus_v6.env

#Create a directory with the same name as the job
NewDirName=${SP_JID}
mkdir $NewDirName
cd $NewDirName

#Copy the input file into the directory
cp "../$inputFile" .
echo "import os">>$envFile
echo "os.environ['ABA_BATCH_OVERRIDE'] = '1'">>$envFile
echo "verbose=3">>$envFile
mp_host_list="["

# Set the hostlist in a format appropriate for Abaqus
for i in $(cat $SP_HOSTLIST) ; do
    mp_host_list="${mp_host_list}['$i', $ncpus],"
done

mp_host_list=`echo ${mp_host_list} | sed -e "s/,$//"`
mp_host_list="${mp_host_list}]"
export mp_host_list
echo "mp_host_list=${mp_host_list}" >>abaqus_v6.env

#Run Abaqus
abaqus job="$inputFile" cpus=$ncpus -verbose 3 standard_parallel=all mp_mode=mpi interactive