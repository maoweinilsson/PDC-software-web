


GPAW module 
==================================================

You can see which versions of gpaw are installed using

.. code-block:: bash

  module avail gpaw

Running GPAW on Beskow
========================
GPAW as it is python based needs to be built using shared libraries on Lindgren. This causes a few complications. Firstly the PrgEnv-gnu environment must be loaded (for more information on the different PrgEnv modules see the `beskow compiling insturtions <https://www.pdc.kth.se/resources/computers/beskow/how-to/compiling>`_).

GPAW also requires ASE and the anaconda python modules to be loaded which is automatically loaded when the gpaw module is loaded.


Running interactively
---------------------
Beskow has no deadicated interactive nodes, but nodes can be booked for interactive use using the queue system.

You can test that you have gpaw set up properly using

.. code-block:: bash

  module swap PrgEnv-cray PrgEnv-gnu		
  module add gpaw/0.10.0
  salloc -n 32 -t 1:00:00		
  aprun -n 32 gpaw-python -c "import gpaw.mpi as mpi; print mpi.rank"

Small tests input files can also be run on the interactive nodes

.. code-block:: bash

  module swap PrgEnv-cray PrgEnv-gnu		
  module add gpaw/0.10.0
  salloc -n 32 -t 1:00:00		
  aprun -n 32 gpaw-python input.py

Using the queue system
----------------------
For large problems you should use the queue system

.. code-block:: bash

  #!/bin/bash

  # Set the allocation to be charged for this job
  # not required if you have set a default allocation
  #SBATCH -A 201X-X-XX

  # The name of the script is myjob
  #SBATCH -J myjob

  # Only 1 hour wall-clock time will be given to this job
  #SBATCH -t 1:00:00

  # Number of nodes
  #SBATCH -N 4
  # Number of MPI processes per node (the following is actually the default)
  #SBATCH --ntasks-per-node=32
  # Number of MPI processes.
  #SBATCH -n 128

  #SBATCH -e error_file.e
  #SBATCH -o output_file.o

  #load the gpaw module
  module swap PrgEnv-cray PrgEnv-gnu		
  module add gpaw/0.10.0

  # Run and write the output into my_output_file
  aprun -n 128 gpaw-python input.py > my_output_file

