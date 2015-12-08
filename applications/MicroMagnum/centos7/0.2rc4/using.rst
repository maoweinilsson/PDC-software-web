Running MicroMagnum on an interactive node on Tegner
-----------------------------------------------

You can book a compute node for interactive running MicroMagnum. The command to do this is *salloc* e.g. ::

 salloc --nodes=1 -t 1:00:00 -C Haswell --gres=gpu:K80:2

which will book one Haswell node with Nvidia Tesla K80 GPU accelerator for one hour. And then run MicroMagnum on the compute node using commands ::

 module add micromagnum/0.2rc4
 python sp4.py -g0

Submitting a MicroMagnum job on Tegner
------------------------------------

A script for running MicroMagnum on Tegner called micromagnum_run.sh is shown below.

.. literalinclude:: files/micromagnum_run.sh
  :language: bash

Note that this script does not include all the arguments that you can supply to micromagnum , but you should add/modify the script to suit your needs. You can copy this script to your home directory at PDC and save it as micromagnum_run.sh. 

.. code-block:: bash

   sbatch micromagnum_run.sh

In this example, we ask to user one GPU for one hour using the *sbatch* command. When the queuing system has processed our request and allocated the node the script steps into action. 

Formation on how to submit jobs on Tegner, see `Job Submission on Tegner <https://www.pdc.kth.se/resources/computers/tegner/how-to/run>`_ .
