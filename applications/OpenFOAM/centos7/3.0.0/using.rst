
Running job in the Batch system on Tegner
-----------------------------------------

The sample job script is written

.. literalinclude:: files/openfoam_run.sh
  :language: bash

where we run on 2 nodes with 48 processors in total. 

To submit the job on Tegner using command

.. code-block:: bash
 
   sbatch openfoam_run.sh


Formation on how to submit jobs on Tegner, see `Job Submission on Tegner <https://www.pdc.kth.se/resources/computers/tegner/how-to/run>`_ .

