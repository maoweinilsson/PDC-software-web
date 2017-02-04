

Running in batch mode on Tegner
------------------------------

To submit a job on single node, you can do so by creating a simple script (comsol_run.sh) which includes

.. literalinclude:: files/fire_run.sh
  :language: bash


and submit the script on the Tenger’s login node:

.. code-block:: bash
 tegner$ sbatch comsol_run.sh

Formation on how to submit jobs on Tegner, see `Job Submission on Tegner <https://www.pdc.kth.se/resources/computers/tegner/how-to/run>`_ .

