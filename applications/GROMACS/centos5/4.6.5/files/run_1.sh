#!/bin/bash
module add easy module add gcc/4.8.1 intelmpi/4.1.0 gromacs/4.6.5
export EXEC=`which mdrun_mpi`
mpirun -np 96 -machinefile $SP_HOSTFILE $EXEC -v -deffnm model
