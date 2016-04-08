

gams module
-----------

To see which versions of gams are available, use the command

.. code-block:: bash

  module avail gams

Running using the queue system
------------------------------

Here is an example job script, job.sh, for running gams

.. code-block:: bash

  #!/bin/bash
  module load gams/24.2.2
  gams inputfile.gms > outputfile.lst


Which can be submitted with

.. code-block:: bash

  sbatch --nodes=1 -t 00:30:00 ./job.sh

Running interactively
---------------------

To run on an interactive node, you can allocate a node

.. code-block:: bash

  salloc --nodes=1 -t 00:30:00

and then run your program with the commands

.. code-block:: bash

  srun gams inputfile.gms > outputfile.lst

License file
------------

Without a valid GAMS license the system will operate as a free demo system. If you own a single-user license, then you can conveniently place it in your Private AFS folder and tell GAMS which license to use with the command line argument "license", for example:

.. code-block:: bash

  gams license=$HOME/Private/gams-lic.txt inputfile.gms > outputfile.lst

Make sure that the license file is not readable by other users. If you own a multi-user license, then you need to use specific AFS groups to control access. For this contact the PDC support for setting up AFS groups or for adding/removing users.
