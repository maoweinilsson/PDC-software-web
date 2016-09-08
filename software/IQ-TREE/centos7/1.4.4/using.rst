Submitting a IQ-TREE job on Tegner
------------------------------------

A script for running MPI version of iqtree on Tegner called iqtree_mpi_run.sh is shown below.

.. literalinclude:: files/iqtree_mpi_run.sh
  :language: bash

Note that this script does not include all the arguments that you can supply to IQ-TREE , but you should add/modify the script to suit your needs. 

.. code-block:: bash

   sbatch iqtree_mpi_run.sh

In this example, we ask two nodes for one hour using the *sbatch* command. When the queuing system has processed our request and allocated the node the script steps into action. 

The sample job script for running hybrid MPI/OpenMP likes

.. literalinclude:: files/iqtree_omp_mpi_run.sh
  :language: bash

Formation on how to submit jobs on Tegner, see `Job Submission on Tegner <https://www.pdc.kth.se/resources/computers/tegner/how-to/run>`_ .
