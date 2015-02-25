:orphan:

.. include:: using.inc



`Ferlin <https://www.pdc.kth.se/resources/computers/ferlin>`_ and `Povel <https://www.pdc.kth.se/resources/computers/povel>`_ have the same architecture and use `EASY <https://www.pdc.kth.se/resources/software/job-scheduler/easy-main/easy>`_ for job submition.

.. code-block:: bash

  module add easy


MPI-only mode (default)
-----------------------

If your input file is called model.tpr and is in your current directory, first prepare the following script and name it e.g. run.sh. This example will execute on 4 nodes with 24 cores each thus run with 96 processes:


.. literalinclude:: files/run_1.sh
  :language: bash


Make the script executable:

.. code-block:: bash

  $ chmod +x run.sh

And submit it through with esubmit:

.. code-block:: bash

  esubmit -n 4 -t 600 ./run.sh

If you want to change the number pf processors make sure to update them both in the run.sh script and in the argument that you are passing to esubmit.

Hybrid-MPI/OpenMP mode (advanced)
---------------------------------

Starting with version 4.6 Gromacs supports hybrid-MPI/OpenMP execution. In hybrid mode it is possible to push the scaling limit for small systems in particular on Povel and Ferlin. The number of threads is given as a parameter to the -ntomp option of mdrun_mpi. Make sure not to oversubscribe the cores! This means that the number of MPI processes launched by mpirun should be equal to the total number of requested cores divided by the number of threads. I.e. using the previous example, if you want to use two OpenMP threads on 4 nodes with 24 cores each = 96 cores, you should launch mpirun with -np 48 (=96/2):


.. literalinclude:: files/run_2.sh
  :language: bash


And submit as usual:

.. code-block:: bash

  esubmit -n 4 -t 600 ./run.sh
