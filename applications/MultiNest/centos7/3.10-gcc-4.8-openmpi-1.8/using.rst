Submitting a multinest job on Tegner
------------------------------------

A script for running multinest on Tegner called multinest_run.sh is shown below.

.. literalinclude:: files/multinest_run.sh
  :language: bash

Note that this script does not include all the arguments that you can supply to multinest , but you should add/modify the script to suit your needs. You can copy this script to your home directory at PDC and save it as multinest_run.sh. 

.. code-block:: bash

   sbatch multinest_run.sh

In this example, we ask two nodes for one hour using the *sbatch* command. When the queuing system has processed our request and allocated the node the script steps into action. 

Formation on how to submit jobs on Tegner, see `Job Submission on Tegner <https://www.pdc.kth.se/resources/computers/tegner/how-to/run>`_ .
