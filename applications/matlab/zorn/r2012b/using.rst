:orphan:

.. include:: using.inc


Running interactively
---------------------

Log in to zorn and submit an interactive job:

.. code-block:: bash

  qsub -I -l nodes=1 -l walltime=00:10:00
  echo $HOSTNAME

Read the output and log in to that node from your local computer. Once logged in to the interactive node:

.. code-block:: bash

  module add matlab/r2012b

Then follow the instructions for running matlab from above.

Running with a jobscript
-------------------------

Since AFS can't be accessed from a batch job, we set the ``$HOME`` environment variable to your nobackup directory in /cfs/zorn. If you need to keep your settings, you will need to copy them into your nobackup directory:

.. code-block:: bash

  NOBACKUP=/cfs/zorn/nobackup/${USER:0:1}/$USER
  cd $NOBACKUP
  mkdir Documents
  cp -r ~/Documents/MATLAB Documents/
  cp -r ~/.matlab .

An example job script (``matlabZorn.sh``) follows below.


.. literalinclude:: files/matlabZorn.sh
  :language: bash


Once you have created your job script, you would execute the command, e.g.

.. code-block:: bash

  qsub -l nodes=1,walltime=30:00 ./matlabZorn.sh

to submit a job with the number of nodes that you want to use (*nodes=1*) and the desired runtime of the job in minutes (*walltime=30:00*).

