#!/bin/bash
. /opt/modules/default/etc/modules.sh
module unload heimdal
module load avl/2013.1

cd $1
fire_cmd -name=fire -nomapping -mpi -cpu=$2 -hostlist=$3 -project_dir=$PWD -case=$4 -solver_vers=v2013.1

