:orphan:

.. include:: using.inc


Running interactively
---------------------

Edge can be run interactively on the Ferlin interactive nodes. These
interactive nodes are intended for short test jobs, all production runs should
be done via the queue system.

To run a job of Edge 5.0 interactively (with 8 cores)::

  $ module add edge/5.0
  $ edge_mpi_run case.ainp 8


Running on the Batch system
---------------------------

To submit a job::

  $ module add easy
  $ esubmit -t120 -n1 ./run_script.sh

The sample job script "run_script.sh":

.. literalinclude:: files/run_script.sh
    :language: bash
