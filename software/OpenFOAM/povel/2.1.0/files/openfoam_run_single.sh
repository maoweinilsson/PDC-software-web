#!/bin/bash
module add gcc/4.6.3 openfoam/2.1.0
. $FOAM_BASHRC
processes=24

mpiexec -np $processes -machinefile $SP_HOSTFILE pimpleFoam -parallel > log_file

