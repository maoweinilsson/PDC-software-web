

To see which versions of openfoam are installed on any of the machines at PDC log into the machine and type

.. code-block:: bash

 module avail openfoam

You should consider questions before running openFOAM such as:

 How often do you save your solution?
 What trace/history of your iterations do you write to file(s)?

To control this behavior you need to modify the corresponding parameters in

.. code-block:: bash
 
 controlDict

Moreover you can adapt your simulation to Lindgren by tweaking the following parameters:

.. code-block:: bash

 writeCompression                    uncompressed;
 runTimeModifiable                   no;

Running on single node job in the Batch system
----------------------------------------------

To submit the job on single node

.. code-block:: bash

 module add easy
 esubmit -n 1 ./submit.sh


The sample job script

.. literalinclude:: files/openfoam_run_single.sh
  :language: bash

Running on multi-node job in the Batch system
----------------------------------------------

If you want to run OpenFoam on 2 to 4 nodes on Povel you can do, e.g.

module add easy
esubmit -n 2 -t 60 ./submit_multinode.sh

The sample job script

.. literalinclude:: files/openfoam_run.sh
  :language: bash


Formation on how to submit jobs on Povel, see `Job Submission on Povel <http://www.pdc.kth.se/resources/software/job-scheduler/easy-main>`_ .

