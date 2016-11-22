

Version 2.7.11 of Python is available via the anaconda/py27/2.4.1 module::

  module load anaconda/py27/2.4.1

Customising the Anaconda environment on Tegner
----------------------------------------------

An example for customising the Anaconda environment on Tegner.

1. Choose a directory for the customised Anaconda environment. It is assumed in the rest of this description that its name is given in the environment variable LOCAL_ANACONDA::

 $ export LOCAL_ANACONDA=/cfs/klemming/nobackup/...

2. Create the customized Anaconda environment with the following commands::

 $ module load anaconda/py27/2.4.1

 $ conda create -m -p $LOCAL_ANACONDA --file $ANACONDA_HOME/conda-packages

 $ module rm anaconda/py27/2.4.1

3. Use the customised environment for interactive work on the login node. This you do f.ex. to install your own packages.::
 
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

