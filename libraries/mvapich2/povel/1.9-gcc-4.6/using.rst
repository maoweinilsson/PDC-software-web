:orphan:

.. include:: using.inc


Running programs
----------------

The environment is defined by loading a compiler module and the matching MPI module, for example::

  module load gcc/4.6.0
  module load mvapich2/1.9-gcc-4.6

How to execute the programs is described in the next section. You can use the
HYDRA process manager. Furthermore is the launch method with
MPD daemons still available.


Launching the application
-------------------------

**Starting with the Hydra process manager**.  The Hydra process manager is a
newer process manager that allows a sophisticated mapping and pinning of MPI
processes to CPU cores. The performance of jobs can sometimes be increased in
that way noticeably. Hydra is now the the default process manager in MVAPICH2
and can be called as "mpiexec" as well as "mpiexec.hydra".

A minimal example of a job script (without Hydra specific options, for more
information see below):

.. code:: bash

  # ... (other things go here)

  cd $WORKDIR
  EXEPATH=/cfs/ekman/nobackup/m/michs/devel/imb/exe

  # Execute the MPI program.
  mpiexec.hydra -f ${PBS_NODEFILE} -n <nr-of-processes> ${EXEPATH}/a.out

  # ... (other things go here)

**Starting with the MPD daemon**. The MPI program can be started by the the
classical mpd daemon mechanism. An example fragment from a jobscript is given
here:

.. code:: bash

  # ... (other things go here)

  cd $WORKDIR
  EXEPATH=/cfs/ekman/nobackup/m/michs/devel/imb/exe

  # Create a machinefile that specifies the number of cores
  # per node, at Ekman have we 8 cores per node.
  cat $PBS_NODEFILE | sed -e "s/$/:8/" >./machines

  # Execute the MPI program.
  mpdboot -n $(cat $PBS_NODEFILE | wc -l) -f $SP_HOSTFILE

  mpiexec.mpd -machinefile ./machines -n <nr-of-processes> ${EXEPATH}/a.out

  mpdallexit

  # ... (other things go here)


More information
----------------

For more information see the
`MVAPICH2 1.9 User documentation text <http://mvapich.cse.ohio-state.edu/support/user_guide_mvapich2-1.9.html>`_.
An introduction to the HYDRA process manager is available on the page
`Using the Hydra process manager <https://wiki.mpich.org/mpich/index.php/Using_the_Hydra_Process_Manager>`_.
