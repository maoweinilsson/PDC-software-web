#!/bin/bash
module add lammps
processes_per_node=8
total_processes=`expr $processes_per_node \* $SP_PROCS`
mpirun -np $total_processes -machinefile $SP_HOSTFILE lmp < infile > outfile
