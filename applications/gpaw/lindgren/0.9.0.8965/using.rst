


GPAWi module 
==================================================

You can see which versions of gpaw are installed using

.. code-block:: bash

  module avail gpaw

Running GPAW on Lindgren
========================
GPAW as it is python based needs to be built using shared libraries on Lindgren. This causes a few complications. Firstly the PrgEnv-gnu environment must be loaded (for more information on the different PrgEnv modules see the `lindgren compiling insturtions <https://www.pdc.kth.se/resources/computers/lindgren/how-to/compiling>`_).

GPAW also requires ASE to be loaded which is included in the site-python module loaded.

GPAW module
-----------
Because gpaw requires some careful setup on Lindgren as well as the basic GPAW modules e.g.

.. code-block:: bash

  gpaw/0.9.0

there are some meta-modules e.g.

.. code-block:: bash

  gpaw/latest

which make sure that

  - The PrgEnv-gnu module is loaded
  - The correct version of gcc is loaded
  - the `site-python <https://www.pdc.kth.se/resources/software/installed-software/compilers-and-languages/python>`_ module is loaded

In general it is best to use the meta-modules

.. code-block:: bash

  gpaw/latest
  gpaw/current
  gpaw/old

but bear in mind the version of gpaw that these refer to can change.

Running interactively
---------------------
As well as the queue system on Lindgren there are a small number of interactive nodes set up.

You can test that you have gpaw set up properly using

.. code-block:: bash

  module add gpaw/latest
  aprun -n 24 gpaw-python -c "import gpaw.mpi as mpi; print mpi.rank"

Small tests input files can also be run on the interactive nodes

.. code-block:: bash

  module add gpaw/latest
  aprun -n 24 gpaw-python input.py

Using the queue system
----------------------
For large problems you should use the queue system

.. code-block:: bash

  # The name of the script is myjob
  #PBS -N myjob

  # Only 1 hour wall-clock time will be given to this job
  #PBS -l walltime=1:00:00

  # Number of MPI tasks.
  # always ask for complete nodes (i.e. mppwidth should normally
  # be a multiple of 24 )
  #PBS -l mppwidth=960

  # Change to the work directory
  cd $PBS_O_WORKDIR
  #enable modules within the batch system
  . /opt/modules/default/etc/modules.sh

  #load the gpaw meta-module
  module add gpaw/latest

  # Run and write the output into my_output_file
  aprun -n 960 gpaw-python input.py > my_output_file

