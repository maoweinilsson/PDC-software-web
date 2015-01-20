:orphan:

.. include:: running.inc

Running on single node job in the Batch system
----------------------------------------------

To submit the job on single node, you can do so by creating a simple script (yourComsolScript.sh) which includes:

.. literalinclude:: files/comsol_run_single.sh
  :language: bash

Make sure the script yourComsolScript.sh is *executable* and submit it from Povel's login node:

.. code-block:: bash

 module add easy
 esubmit -n 1 -t 60 ./yourComsolScript.sh

Comsol figures out itself that there are 24 cores on Povel and will use these. If you want to limit the number of cores used (for instance to give them each more memory) you should pass the flag *-np* and the number of cores you want to use.


Running on multi-node job in the Batch system
----------------------------------------------

If you want to run comsol on 2 to 4 nodes on Povel you can do by creating a simple script which includes:

.. literalinclude:: files/comsol_run.sh
  :language: bash

Make sure the script yourComsolMultiScript.sh is *executable* and submit it from Povel's login node:

.. code-block:: bash

 module add easy
 esubmit -n yourNumberOfNodes -t 60 ./yourComsolMultiScript.sh

Formation on how to submit jobs on Povel, see `Job Submission on Povel <http://www.pdc.kth.se/resources/software/job-scheduler/easy-main>`_ .

