#!/bin/bash

module add fire/2013.0

# 24 processes on Povel and 8 processes per node on Ferlin
processes_per_node=24
total_processes=`expr $processes_per_node \* $SP_PROCS`

export hosts=`hostconvert_fire_povel.pl $SP_HOSTFILE`
export MPI_REMSH=/pdc/vol/fire/2011.1/PDC_bin/ssh

cfdwm_solver -name=fire -nomapping  -mpi -cpu=$total_processes -hostlist=$hosts -project_dir=$PWD
