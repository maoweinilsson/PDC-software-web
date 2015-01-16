:orphan:


Running StarCCM+ at PDC
=====================

Running on the Batch system
---------------------------

sample job script

.. literalinclude:: files/starccm_run.sh
  :language: bash

.. code-block:: bash

 #SBATCH -n 96

line and at the bottom when you specify

.. code-block:: bash

 -np 96

Formation on how to submit jobs on Beskow, see  `Job submission on Beskow <https://www.pdc.kth.se/resources/computers/beskow/how-to/run>`_ .

