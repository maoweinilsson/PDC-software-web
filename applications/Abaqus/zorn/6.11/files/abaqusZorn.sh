#!/bin/bash
module add abaqus/6.12 

# The name of job
jobName=myjob

# The input file 
inputFile=myInputFile

# The file of environment variables
envFile=abaqus_v6.env

# The work directory
cd $PBS_O_WORKDIR

# The number of CPUs per node
cpus_per_node=8

np=$(cat $PBS_NODEFILE | wc -l)

# The total number of CPUs
ncpus=`expr $cpus_per_node \* $np`

# The total number of GPUs
ngpus=3

# Write the environment variables
echo "import os">$envFile
echo "os.environ['ABA_BATCH_OVERRIDE'] = '1'">>$envFile
echo "os.environ['BAS_DISABLE_FILE_LOCKING']='1'" >> $envFile
echo "mp_environment_export += ('BAS_DISABLE_FILE_LOCKING', )" >> $envFile

echo "verbose=3">>$envFile
mp_host_list="["

for i in $(cat $PBS_NODEFILE) ; do
    mp_host_list="${mp_host_list}['$i', $cpus_per_node],"
done

mp_host_list=`echo ${mp_host_list} | sed -e "s/,$//"`
mp_host_list="${mp_host_list}]"

export mp_host_list

echo "mp_file_system=(SHARED, LOCAL)" >> $envFile
echo "mp_host_list=${mp_host_list}" >> $envFile


# Without GPUs
abaqus job=$inputFile cpus=$ncpus -verbose 3 standard_parallel=all scratch=$PBS_O_WORKDIR mp_mode=mpi interactive

# With GPUs
# abaqus job=$inputFile cpus=$ncpus gpus=$ngpus -verbose 3 standard_parallel=all scratch=$PBS_O_WORKDIR mp_mode=mpi interactive
