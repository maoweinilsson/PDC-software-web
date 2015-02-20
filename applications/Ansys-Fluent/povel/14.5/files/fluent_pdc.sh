#!/bin/bash
# fluent-pdc.sh script 
# This script was originally created by 
# Pedro Costa, pedro.costa@energy.kth.se
# ----------------------- HELP MENU -----------------------------------------------
mail="support@pdc.kth.se"
help()
{
cat <<HELP
fluent-pdc.sh -- run fluent on a PDC cluster. This script must 
always be preceded by the esubmit command and its respective
arguments.

USAGE:
fluent-pdc.sh [-h] -ppn -solver -journalfile
Note that the order in which these arguments appear must be the 
one specified here
-h help text (this is an option)
-ppn number of processes to run on each node (up to 8 for Ferlin)
-solver version of solver (2d, 2ddp, 3d, 3ddp)
-journalfile journal file (include path, if necessary)
EXAMPLE:
esubmit -n 2 -t 15 ./fluent-pdc.sh 8 3ddp ./case.jou
Here we requested 2 nodew for 15 minutes with esubmit. 
We chose to take advantage of 8 CPUs per node and run
the fluent 3d double precision solver. Instructions will 
be given to the solver via the file case.jou

BUGS/SUGGESTIONS:
$mail
HELP
exit 0
}
# -------------------------------------------------------------------------------------
error()
{
echo "$1"
exit 1
}
# --------------------------- READ USER SUPPLIED OPTIONS ------------------------------
while [ -n "$1" ]; do
case $1 in
-h) help;shift 1;;
-*) echo "error: no such option $1. -h for help";exit 1;;
*) break;;
esac
done
PPN=$1; # nr of processors per node
SOL=$2; # version of solver
JOU="$3"; # path to journalfile
LOGFILE=./$SP_JID.log
test $SP_PROCS || exit 255
module add heimdal fluent/14.5
# ------------------------- RUN FLUENT (PARALLELIZATION) ------------------------------
if [ $SP_PROCS -gt 1 ]; then
# use SP_HOSTFILE to create the correct format and rename it
i=0
while [ $i -lt $PPN ]; do
       cat $SP_HOSTFILE > $SP_JID.hosts
       i=$((i+1))
done
echo "CNF file is: ">>$LOGFILE
cat $SP_JID.hosts >>$LOGFILE
FLUENTARGS="-t`expr $PPN \* $SP_PROCS` -cnf=$SP_JID.hosts -pethernet -mpi=openmpi"
elif [ $PPN -gt 1 ]; then
# use shared memory MPI only
FLUENTARGS="-t$PPN"
fi
echo "Executing fluent in directory `pwd`">>$LOGFILE
echo "fluent $SOL -g $FLUENTARGS -i $JOU" >>$LOGFILE
fluent $SOL -g $FLUENTARGS -i "$JOU"
echo "Finished running Fluent" >>$LOGFILE

