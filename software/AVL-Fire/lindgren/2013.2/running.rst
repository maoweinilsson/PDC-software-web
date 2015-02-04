:orphan:

.. include:: running.inc

On Lindgren to use Fire then cluster compatability mode (CCM) must be used. Note your account must be specially enabled to use CCM on Lindgren. Contact support@pdc.kth.se if you need your account to be able to use CCM.

Running interactively on Lindgren
---------------------------------

It is not possible to use the interactive nodes to run CCM jobs. However it is possible to reserve some nodes in CCM mode and use them interactively. To do this use. If no nodes are available you will join the batch queue until they become available.

.. code-block:: bash

 qsub -q ccm -I -l mppwidth=48 -l walltime=30:00

then fire can be started using

.. code-block:: bash

 module load ccm avl
 nodes=`hostconvert_fire.pl $PBS_NODEFILE`
 ccmrun run_fire.sh $PBS_O_WORKDIR 48 $nodes CaseName

The default *run_fire.sh* is shown below. If you need different flags for *cfdwm_solver* then a new run_fire.sh script can be made and used instead.

Also the command

.. code-block:: bash

 ccmlogin

can be used to login to the head node of the ccm allocation, at which point it is possible to call *cfdwm_solver* directly. The enviroment variable *$PBS_NODEFILE* is not exported in this case though, so the nodes must be set carefully.

Running in batch mode on Lindgren
---------------------------------

To run in batch mode it similar to running a normal job, except the special CCM queue must be used. With CCM it is necessary to use two scripts. A PBS job script and the script that gets started by CCM on the reserved nodes.

Example PBS script 

.. literalinclude:: files/fire_submit.sh
  :language: bash

and the **run_fire.sh** script (make the file executable!) looks likes

.. literalinclude:: files/fire_run.sh
  :language: bash

Formation on how to submit jobs on Lindgren, see `Job Submission on Lindgren <https://www.pdc.kth.se/resources/computers/lindgren/how-to/run>`_ .

