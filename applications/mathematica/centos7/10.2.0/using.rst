Mathematica v10.2.0 is available via loading module:

.. code-block:: bash

 module load mathematica/10.2.0

Running Mathematica with GUI on an interactive node on Tegner
-------------------------------------------------------------

First you should have to book an interactive node from the login node (i.e. tegner) and then you start to launch the mathematica with GUI on the interactive node.  

1. Login to Tegner (tegner.pdc.kth.se)

2. Go to your working directory (cd ~/... or cd /cfs/klemming/...)

3. Load the mathematica module you want, for instance:

.. code-block:: bash

   tegner$ module add mathematica/10.2.0

4. Book an interactive node, 

.. code-block:: bash
    
   tegner$ salloc --nodes=1 -t 01:00:00  # 1 hour
   salloc: Granted job allocation 2364
   salloc: Waiting for resource configuration
   salloc: Nodes t02n01 are ready for job

5. Launch Mathematica with GUI on the interactive node (the node is *t02n01.pdc.kth.se* in the example),

.. code-block:: bash

   local$ ssh -X your_username@t02n01.pdc.kth.se # login from your local computer
   t02n01$ mathematica 

Notice that you should have to login from your local computer with your PDC username.  The above should then start the mathematica on the node *t02n01.pdc.kth.se*.. 


Running on single node job in the batch system on Tegner
--------------------------------------------------------

To submit a job on a single node, you can do so by creating a simple script (e.g. mathematica_run.sh) which includes:

.. literalinclude:: files/mathematica_run.sh
  :language: bash

and submit the script on the Tenger's login node:

.. code-block:: bash
   
   tegner$ sbatch mathematica_run.sh

