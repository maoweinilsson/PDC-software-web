Running mumax3 on an interactive node on Tegner
-----------------------------------------------

You can book a compute node for interactive running mumax3. The command to do this is *salloc* e.g. ::

 salloc --nodes=1 -t 1:00:00 -C Haswell --gres=gpu:K80:2

which will book one Haswell node with Nvidia Tesla K80 GPU accelerator for one hour. And then run mumax3 on the compute node using commands ::

 module add mumax3/3.9.1c
 srun mumax3 myfile.mx3

Submitting a mumax3 job on Tegner
---------------------------------

A script for running mumax3 on Tegner called mumax3_run.sh is shown below.

.. literalinclude:: files/mumax3_run.sh
  :language: bash

Note that this script does not include all the arguments that you can supply to mumax3 , but you should add/modify the script to suit your needs. You can copy this script to your home directory at PDC and save it as mumax3_run.sh. 

.. code-block:: bash

   sbatch mumax3_run.sh

In this example, we ask to user one GPU for one hour using the *sbatch* command. When the queuing system has processed our request and allocated the node the script steps into action. 

Formation on how to submit jobs on Tegner, see `Job Submission on Tegner <https://www.pdc.kth.se/resources/computers/tegner/how-to/run>`_ .
