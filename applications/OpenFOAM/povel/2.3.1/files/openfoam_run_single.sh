#!/bin/bash
module add gcc/4.8.1 openfoam/2.3.1
. $FOAM_BASHRC
processes=24

mpiexec -np $processes -machinefile $SP_HOSTFILE pimpleFoam -parallel > log_file

