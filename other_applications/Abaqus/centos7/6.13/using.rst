

Submitting an Abaqus job on AFS system on Tegner
------------------------------------------------

A script for running Abaqus on AFS system on Tegner called abaqus_run.sh is shown below.

.. literalinclude:: files/abaqus_run.sh
  :language: bash

Note that this script does not include all the arguments that you can supply to Abaqus , but you should add/modify the script to suit your needs. You can copy this script to your home directory at PDC and save it as abaqus_run.sh. 

.. code-block:: bash

   sbatch abaqus_run.sh

In this example, we ask to user 2 nodes for one hour using the *sbatch* command. When the queuing system has processed our request and allocated the node the script steps into action. We have chosen to run on full processors on the node. The Abaqus input file, yourFile.inp, is assumed to be located in the same directory as the *abaqus_run.sh* script.

Once the job has finished, you will also find the output in a subdirectory by the name of the job number you had.

Submitting an Abaqus job on CFS system on Tegner
------------------------------------------------
If you want to run Abaqus on /cfs/klemming system, the following sample script  called abaqus_run.sh can be sued.


.. literalinclude:: files/abaqus_run_cfs.sh
  :language: bash

Formation on how to submit jobs on Tegner, see `Job Submission on Tegner <https://www.pdc.kth.se/resources/computers/tegner/how-to/run>`_ .
