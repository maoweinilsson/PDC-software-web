

Load the module with::

  $ module load gerris/20131206

Submitting a gerris job on Tegner
---------------------------------

A script for running gerris on Tegner called *gerris_run.sh* is shown below.

.. literalinclude:: files/gerris_run.sh
  :language: bash

Note that this script does not include all the arguments that you can supply to gerris , but you should add/modify the script to suit your needs. You can copy this script to your home directory at PDC and submit it using command 

.. code-block:: bash

   sbatch gerris_run.sh

Formation on how to submit jobs on Tegner, see `Job Submission on Tegner <https://www.pdc.kth.se/resources/computers/tegner/how-to/run>`_ .

