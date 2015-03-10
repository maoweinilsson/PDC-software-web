:orphan:

.. include:: using.inc

gams module
-----------

To see which versions of gams are available, use the command

.. code-block:: bash

  module avail gams

Running using the queue system
------------------------------

Here is an example job script for running gams

.. literalinclude:: files/gams_running.sh
  :language: bash


Which can be submitted with

.. code-block:: bash

  module load easy
  esubmit -n1 -t120 sh ./job.sh

Running interactively
---------------------

To run on an interactive node, you can connect with

.. code-block:: bash

  module load easy
  spattach -i
  ssh -K $(cat $SP_HOSTFILE)

and then run your program with the commands

.. code-block:: bash

  module load gams
  gams inputfile.gms > outputfile.lst

License file
------------

Without a valid GAMS license the system will operate as a free demo system. If you own a single-user license, then you can conveniently place it in your Private AFS folder and tell GAMS which license to use with the command line argument "license", for example:

.. code-block:: bash

  gams license=$HOME/Private/gams-lic.txt inputfile.gms > outputfile.lst

Make sure that the license file is not readable by other users. If you own a multi-user license, then you need to use specific AFS groups to control access. For this contact the PDC support for setting up AFS groups or for adding/removing users.
