

======
GAMESS
======


About GAMESS
============

The General Atomic and Molecular Electronic Structure System (GAMESS)
is a general ab initio quantum chemistry package.
GAMESS is maintained by the members of the Gordon research group at Iowa State University.
For more information visit the
`GAMESS website <http://www.msg.ameslab.gov/GAMESS/GAMESS.html>`_.
See also the
`GAMESS information in the SNIC knowledge base <http://docs.snic.se/wiki/GAMESS>`_.


Appropriate citation
--------------------

It is essential that you read the GAMESS manual thoroughly to properly
reference the papers specified in the instructions. All publications using
gamess should cite at least the following paper::

  @Article{GAMESS,
     author={M.W.Schmidt and K.K.Baldridge and J.A.Boatz and S.T.Elbert and
               M.S.Gordon and J.J.Jensen and S.Koseki and N.Matsunaga and
               K.A.Nguyen and S.Su and T.L.Windus and M.Dupuis and J.A.Montgomery},
     journal={J.~Comput.~Chem.},
     volume=14,
     pages={1347},
     year=1993,
     comment={The GAMESS program}}


Performance optimization
========================

It is highly recommended to use::

  $SCF DIRSCF=.TRUE. $END

The default value of DIRSCF=.FALSE. causes integrals to be written to disk for
later use and considerably (negatively) affects the performance of the file
system and of your calculation.


GAMESS on Lindgren
==================

The most recent version installed on Lindgren is 20120501R1_v2::

  module avail gamess

Example job script::

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


GAMESS on Povel
===============

The most recent version installed on Povel is 2013-05-01-R1::

  module avail gamess

Example job script::

  #!/bin/bash

  # we load gamess
  module add gamess/2013-05-01-R1

  # we load the modules that we need
  module add i-compilers intelmpi mkl

  NR_NODES=$(cat ${SP_HOSTFILE} | wc -l)

  PROCS_PER_NODE=24
  MPI_PROCS=$[NR_NODES*$PROCS_PER_NODE]

  # this env variable is used in gamess
  export NNODES=$NR_NODES

  # IMPORTANT - read this:
  # create scratch directory
  # the default scratch directory is /scratch/$USER/gamess
  # but the user can override it by setting CUSTOM_GAMESS_SCRATCH
  # NEVER point CUSTOM_GAMESS_SCRATCH to your home directory
  # since the program might erase the scratch space after the calculation
  # terminates
  export CUSTOM_GAMESS_SCRATCH=/cfs/klemming/scratch/${USER:0:1}/${USER}/gamess_scratch/$SP_JID

  # now start gamess
  rungms exam01.inp 01 $MPI_PROCS $PROCS_PER_NODE
