#!/bin/bash -l

python /pdc/vol/amber/14/amber12/bin/MMPBSA.py.MPI -O -i mmgbsa1.in -o MMGBSA1.dat -sp 2BEG_AZD_wi.prmtop -cp 2BEG_AZD.prmtop -rp 2BEG.prmtop -lp AZD.prmtop -y nvt.mdcrd >& MMPBSA.log
