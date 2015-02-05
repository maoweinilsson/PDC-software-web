:orphan:


.. include:: using.inc


Example job script
------------------

::

  # the name of this job
  #PBS -N gamess

  # wall time limit
  #PBS -l walltime=04:00:00

  # stdout and stderr
  #PBS -e pbs.$PBS_JOBID.stderr
  #PBS -o pbs.$PBS_JOBID.stdout

  # number of mpi tasks, this has to match the number when calling rungms below
  #PBS -l mppwidth=96

  # enable modules within the batch system
  . /opt/modules/default/etc/modules.sh

  # load the gamess module
  module add gamess/20120501R1_v2

  # IMPORTANT - read this:
  # create scratch directory
  # the default SCF directory is /cfs/klemming/scratch/${USER:0:1}/${USER}/gamess_scratch
  # the default USERSCF directory is /cfs/klemming/nobackup/${USER:0:1}/${USER}/gamess_scratch
  # but the user can override it by setting CUSTOM_GAMESS_SCRATCH
  # NEVER point CUSTOM_GAMESS_SCRATCH to your home directory
  # since the program might erase the scratch space after the calculation
  # terminates
  export CUSTOM_GAMESS_SCRATCH=/cfs/klemming/scratch/${USER:0:1}/${USER}/gamess_scratch/$PBS_JOBID

  # change to the work directory
  cd $PBS_O_WORKDIR

  # run gamess with input file example.inp
  # the number of mpi tasks has to match mppwidth above
  rungms example 01 96 > example.out
