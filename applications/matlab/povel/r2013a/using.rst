:orphan:

.. include:: using.inc


A simple bash script for submitting Matlab jobs on Ferlin can look like this:


.. literalinclude:: files/run_1.sh
  :language: bash


Save the above script as ``ferlinMatlab.sh``. Update the directory name and the names of the .m and .out file to reflect what you are running. On Ferlin, you need to do the following to submit the script (here, for 5 minutes):


.. code-block:: bash


  module add easy
  esubmit -n1 -t5 ./ferlinMatlab.sh

Don't forget to make the script executable before using it for the first time:

.. code-block:: bash

  chmod u+x ./ferlinMatlab.sh
