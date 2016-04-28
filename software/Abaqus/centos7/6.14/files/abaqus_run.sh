#!/bin/bash 

# The name of the script is myjob
#SBATCH -J myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH -N 1

# Number of MPI processes per node 
##SBATCH --ntasks-per-node=24

#SBATCH -e error_file.e
#SBATCH -o output_file.o

# load module abaqus v6.14
module add abaqus/6.14
export MPI_REMSH=/pdc/vol/abaqus/6.14/6.14-1/PDC_bin/ssh

# The input file
inputFile=myFile

# Create a new directory 
NewDirName=${SLURM_JOBID}
mkdir $NewDirName
cd $NewDirName
cp ../*.inp .

# The number of processors per node
#ncpus=24
ncpus=`echo $SLURM_TASKS_PER_NODE | cut -c1-2`

# The number of total processors 
ntcpus=`expr $SLURM_NNODES \* $ncpus`

# The file of environment variables 
envFile=abaqus_v6.env 

# Write the environment variables
echo "import os" > $envFile
echo "os.environ['ABA_BATCH_OVERRIDE'] = '1'" >> $envFile
echo "verbose=3" >> $envFile

# The file of node lists
node_list=ABAQUS_NODES
 
srun hostname | sort  > $node_list 
mp_host_list="["
for i in $(cat ${node_list}) ; do
    mp_host_list="${mp_host_list}['$i', $ncpus],"
done

mp_host_list=`echo ${mp_host_list} | sed -e "s/,$//"`
mp_host_list="${mp_host_list}]"

export mp_host_list

echo "mp_host_list=${mp_host_list}"  >> abaqus_v6.env

# Run abaqus
abaqus job=$inputFile cpus=$ntcpus -verbose 3 standard_parallel=all mp_mode=mpi interactive

