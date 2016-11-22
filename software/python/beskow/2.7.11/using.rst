

Version 2.7.11 of Python is available via module anaconda/py27/2.5::

  module load anaconda/py27/2.5

Customising the Anaconda environment on Beskow
----------------------------------------------

An example for customising the Anaconda environment on Beskow.

1. Choose a directory for the customised Anaconda environment. It is assumed in the rest of this description that its name is given in the environment variable LOCAL_ANACONDA

.. code-block:: bash

 $ export LOCAL_ANACONDA=/cfs/klemming/nobackup/...

2. Create the customized Anaconda environment with the following commands

.. code-block:: bash

 $ module load anaconda/py27/2.5
 $ conda create -m -p $LOCAL_ANACONDA --file $ANACONDA_HOME/conda-packages
 $ module rm anaconda/py27/2.5

3. Use the customised environment for interactive work on the login node. This you do f.ex. to install your own packages.
 
.. code-block:: bash

 $ source $LOCAL_ANACONDA/bin/activate $LOCAL_ANACONDA
 # ... do a lot of work
 # f.ex. install packages

 $ pip install mako
 # ... done

 $ source $LOCAL_ANACONDA/bin/deactivate


Using a customised environment
------------------------------

 In order to run your Python program in a batch job, write your jobscript using the following example. Please note the use of the environment variable **LOCAL_ANAONDA** pointing to your personal environment.

.. literalinclude:: files/python_run.sh
  :language: bash
