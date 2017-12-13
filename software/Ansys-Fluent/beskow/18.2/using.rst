

Submitting a Fluent job on Beskow
---------------------------------


A script for running Ansys/Fluent on beskow called fluent_run.sh is shown below.

.. literalinclude:: files/fluent_run.sh
  :language: bash

Note that this script does not include license information which you should provide yourself.


.. code-block:: bash
 
 sbatch fluent_run.sh 

In this example, we requested 8 nodes for 24 hours. We also have chosen to run on full processors per node with the fluent 3d double precision solver. Here the instructions is given to the Fluent solver via the journal file mycase.jou which is assumed to be located in the same directory as the *fluent_run.sh* script. 
  
