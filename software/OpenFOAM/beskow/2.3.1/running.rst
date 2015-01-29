:orphan:

.. include:: running.inc

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

Running on the Batch system
---------------------------

sample job script

.. literalinclude:: files/openfoam_run.sh
  :language: bash

Formation on how to submit jobs on Beskow, see `Job Submission on Beskow <https://www.pdc.kth.se/resources/computers/beskow/how-to/run>`_ .

