:orphan:


Running StarCD at PDC
=====================

Running Interactively
---------------------

StarCD can be run interactively on the Lindgren login nodes. These nodes are intended for short test jobs, all production runs should be done via the queue system.

To run a StarCD job interactively (in this case using 4 nodes/96 cores)

.. code-block:: bash

  cd /to/the/directory/with/the/input/files
  mkdir -p temp
  module add starcd
  star -dp -mpi=xt -scratch=$PWD/temp 96


The input files directory must be on the lustre system. If there are not enough free interactive nodes when you submit the request, then the job will be held in a simple queue.


Running on the Batch system
---------------------------

sample job script

.. literalinclude:: files/run.pbs
  :language: bash


Note that the number of MPI tasks must be set twice, once on the mppwidth line and once at the end of the star line. Remember that the home directories are not mounted on the Lindgren nodes, so all the input files and the job script should be in the Lustre filesystem. See the main Lindgren documentation for more details.
