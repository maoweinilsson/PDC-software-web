

Submitting a CFX job on Beskow
------------------------------

A script for running Ansys/CFX on beskow called cfx_run.sh is shown below.

.. literalinclude:: files/cfx_run.sh
  :language: bash

and submit it from Beskow's login node

.. code-block:: bash

 sbatch cfx_run.sh

Note that this script does not include license information which you should provide yourself.
In this example, we requested eight nodes for 24 hours and have chosen to run on full processors per node with *cfx5solve*. 

