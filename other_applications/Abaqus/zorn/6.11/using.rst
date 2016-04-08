

A script for running Abaqus on Zorn called abaqusZorn.sh is shown below.

.. literalinclude:: files/abaqusZorn.sh
  :language: bash

Note that this script does not include all the arguments that you can supply to Abaqus, but you can/should add/modify the script to suit your needs. You can copy this script to your home directory at PDC and save it as abaqusZorn.sh. Make sure its permissions are set to executable:

.. code-block:: bash

  chmod u+x  abaqusZorn.sh

Once you have created your job script, you would execute the command, e.g.

.. code-block:: bash

  qsub -l nodes=1,walltime=30:00 ./abaqusZorn.sh

to submit a job with the number of nodes that you want to use (nodes=1) and the desired runtime of the job in minutes (walltime=30:00).

Abaqus tokens
^^^^^^^^^^^^^

Any Abaqus job requires 4 tokens to run, plus an extra 1 token for each CPU. So a single CPU job requires 5 tokens, a 2 processor job requires 6, a 4 processor job requires 8, and an 8 processor job requires 12 tokens.
