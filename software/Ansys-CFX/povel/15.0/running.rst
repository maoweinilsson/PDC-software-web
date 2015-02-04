:orphan:

.. include:: running.inc

Submitting a CFX job on Povel
--------------------------------

Single node job
---------------
If you want to run Ansys CFX on one node on Ferlin/Povel you can do so by creating a simple script (e.g. *cfx_run.sh*) which includes:

.. literalinclude:: files/cfx_run.sh
  :language: bash

Make sure the script *cfx_run.sh* is executable and submit it from Povel's login node

.. code-block:: bash

 module add easy
 esubmit -n 1 -t 60 ./cfx_run.sh ./Your_CFX_Definition.def <Your_Partition_Count> 

Note the above *Your_CFX_Definition.def* should be replaced by your definition file and *Your_Partition_Count* by the partition count. If the *Your_Partition_Count* is NOT specified, a partition file (.par) is assumed to be created in the same directory.  

Multi node job
-------------
If you want to run Ansys CFX with 2 to 4 nodes on Povel, you can do  by creating a simple script which includes:

.. literalinclude:: files/cfx_run2.sh
  :language: bash

From Povel's login node to sumbit it using

.. code-block:: bash

 module add easy
 esubmit -n Your_Number_Of_Nodes -t 60 ./cfx.sh ./Your_CFX_Definition.def Your_Partition_Count

Here,  *Your_Number_Of_Nodes* has to match the number of nodes that you request with esubmit as well as *Your_Partition_Count* should be less than Your_Number_Of_Nodes*24.


