# The name of the script is myjob
#PBS -N myjob

#use ccm
#PBS -q ccm

# Only 1 hour wall-clock time will be given to this job
#PBS -l walltime=1:00:00

# Number of cores to be allocated is 288.
# always request full nodes, i.e. mppwidth should normally be a multiple of 24
#PBS -l mppwidth=288

# Change to the work directory
cd $PBS_O_WORKDIR

#enable modules in the queue system
. /opt/modules/default/etc/modules.sh

module load ccm avl/2011

#build the string so that fire knows which nodes are available
nodes=`hostconvert_fire_half.pl $PBS_NODEFILE`

# start the avi_fire job
# run_fire.sh takes 4 values. The work directory, the number of nodes
# the nodes string built above and the casename. 
ccmrun run_fire.sh $PBS_O_WORKDIR 288 $nodes CaseName

