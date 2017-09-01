

Running on the Batch system
---------------------------

sample job script

.. literalinclude:: files/openfoam_run.sh
  :language: bash

Formation on how to submit jobs on Beskow, see `Job Submission on Beskow <https://www.pdc.kth.se/resources/computers/beskow/how-to/run>`_ .

Compiling the third-part libraries 
----------------------------------

For this version, it requires to add wmake flag "-update" to compile the third-part libraries on an interactive node, i.e., ::

$ module sw PrgEnv-cray PrgEnv-gnu
$ module add openfoam/4.1
$ . $FOAM_BASHRC
$ salloc -N 1 # book a node
$ aprun -n 1 -b wmake -update

