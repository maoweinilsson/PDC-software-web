

Version 3.4.2 of Python is available via the anaconda/py34/2.1 module::

  module load anaconda/py34/2.1

Customising the Anaconda environment on Tegner

An example for customising the Anaconda environment on Tegner.

#There is sometimes the need to install python packages on one's own because they are not included in the setup provided on the cluster or it might be necessary to use a specific module version. Every typical customising approach of Python working with normal user rights is possible on the Beskow too. The following notes give some hints for one possible approach using the Anaconda installation on Beskow.
#Creating a customised environment

1. Choose a directory for the customised Anaconda environment. It is assumed in the rest of this description that its name is given in the environment variable LOCAL_ANACONDA ::

 $ export LOCAL_ANACONDA=/cfs/klemming/nobackup/...

2. Create the customized Anaconda environment with the following commands ::

 $ module load anaconda/py34/2.1
 $ conda create -m -p $LOCAL_ANACONDA --file $ANACONDA_HOME/conda-packages
 $ module rm anaconda/py34/2.1

3. Use the customised environment for interactive work on the login node. This you do f.ex. to install your own packages. ::

 $ source $LOCAL_ANACONDA/bin/activate $LOCAL_ANACONDA
 # ... do a lot of work

 # f.ex. install packages
 $ pip install mako

 # ... done
 $ source $LOCAL_ANACONDA/bin/deactivate

Using a customised environment

    Using the customised environment in batch jobs. In order to run your Python program in a batch job, write your jobscript using the following example. Please note the use of the environment variable *LOCAL_ANAONDA* pointing to your personal environment.

.. literalinclude:: files/python_run.sh
  :language: bash

