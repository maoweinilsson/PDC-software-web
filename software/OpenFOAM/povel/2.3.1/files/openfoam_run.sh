#!/bin/bash
module add gcc/4.8.1 openfoam/2.3.1
. $FOAM_BASHRC

# 24 processes per node on Povel
processes_per_node=24

# Total processes = processes_per_node*nodes
total_processes=`expr $processes_per_node \* $SP_PROCS`

# The OpenFOAM environment variables will be used in mpirun command 
mpienvopts=`echo \`env | grep WM_ | sed -e "s/=.*$//"\` | sed -e "s/ / -x /g"`
mpienvopts2=`echo \`env | grep FOAM_ | sed -e "s/=.*$//"\` | sed -e "s/ / -x /g"`

# Set the path of mpirun 
export OPENMPI_ARCH_PATH=/pdc/vol/openfoam/2.3.0/ThirdParty-2.3.0/platforms/linux64Gcc/openmpi-1.6.3
export OPAL_PREFIX=$OPENMPI_ARCH_PATH 

# Run the OpenFOAM on multi-node
mpirun -prefix $OPAL_PREFIX -np $total_processes -hostfile $SP_HOSTFILE -x PATH -x LD_LIBRARY_PATH -x MPI_BUFFER_SIZE -x $mpienvopts -x $mpienvopts2 pimpleFoam -parallel > log_file

