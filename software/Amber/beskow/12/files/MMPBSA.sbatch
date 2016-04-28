#!/bin/bash -l

#SBATCH -J amber-debug
#SBATCH --error=AMBER_%J.err
#SBATCH --output=AMBER_%J.out
#SBATCH --time=00:20:00
#SBATCH --nodes 1
#SBATCH -n 2

module add amber/12

module load anaconda/py27/2.1
export CRAY_ROOTFS=DSL

# put this line immediately before aprun
source activate_python

aprun -n 2 ./MMPBSA.sh

# put this line immediately after aprun
source deactivate_python

exit 0
