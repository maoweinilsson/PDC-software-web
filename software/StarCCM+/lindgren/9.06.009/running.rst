:orphan:


Running StarCCM+ at PDC
=====================

Running on the Batch system
---------------------------

sample job script

.. literalinclude:: files/run.pbs
  :language: bash

.. code-block:: bash

 #PBS -l mppwidth=288

line and at the bottom when you specify

.. code-block:: bash

 -np 288

Formation on how to submit jobs on Lindgren, see Job Submission on Lindgren.

