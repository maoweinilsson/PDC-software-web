

Getting access to AVL FIRE at PDC
---------------------------------
In order to use AVL FIRE at PDC you need to:

1. Have an account at PDC.

2. Contact PDC (support@pdc.kth.se) to be added to the group of Fire users (no necessary for Scania users). When contacting us, please state which reseach project that you are working.

3. On Povel

.. code-block:: bash

    module avail fire
 
to list all available versions and make sure that the correct version is loaded in the job script.


Running in batch mode on Povel
------------------------------
Running using jobs that have been reserved with spattach is also possible, but more complicated and not convered here

.. code-block:: bash

 module add easy
 esubmit -n 2 -t 60 ./job.sh

will submit a job on 2 nodes (48 cores on Povel) with a duration of 60 minutes.

Sample job script

.. literalinclude:: files/fire_run.sh
  :language: bash

