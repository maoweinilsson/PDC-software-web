

Running in batch mode on Povel
------------------------------

Running using jobs that have been reserved with spattach is also possible, but
more complicated and not convered here

.. code-block:: bash

 module add easy
 esubmit -n 2 -t 60 ./job.sh

will submit a job on 2 nodes (48 cores on Povel) with a duration of 60 minutes.

Sample job script

.. literalinclude:: files/fire_run.sh
  :language: bash
