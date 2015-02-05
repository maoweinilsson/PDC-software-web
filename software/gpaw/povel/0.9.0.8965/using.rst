:orphan:


.. include:: using.inc

GPAWi module 
==================================================

You can see which versions of gpaw are installed using

.. code-block:: bash

  module avail gpaw


Running GPAW on ferlin
======================
Running using the queue system
------------------------------
For large problems you should use the queue system. A basic job script would look something like this

.. code-block:: bash

  #!/bin/sh

  # load the gpaw module and its prerequisits
  module load python/2.6.5 mpi hdf5 gpaw

  # To run gpaw in serial
  gpaw-python input.py

  # To run gpaw in parallel
  mpirun -np 8 gpaw-python input.py

And it can be submitted with

.. code-block:: bash

  module load easy
  esubmit -t 10 -n 1 sh ./job.sh
 
