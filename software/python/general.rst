
How to use Python on PDC machines
===================================

Multiple versions of Python are installed on PDC machines.

To see which version of Python is available by default use the command::

  python -V

Anaconda
=========================

Python has a very large number of optional packages for 
large-scale data processing and scientific computing 
which are not available in the default system Python.
Many of these packages can be found in the 
enterprise-ready Anaconda Python distribution, 
which is installed on both Beskow and Tegner 
and provided in several modules.
To list all available Anaconda modules, type::

   $ module avail anaconda

For example, to load Anaconda version 4.3 for Python 2.7, type::

   $ module load anaconda/py27/4.3

and to load the Python 3.6 version type::

   $ module load anaconda/py36/4.3

After loading an Anaconda module, the Python version can be printed by::

   $ python --version
   Python 2.7.13 :: Continuum Analytics, Inc.


The conda package manager can be used to list the packages installed in a given Anaconda module::

  $ conda list

In addition to the root environment, which is activated by default after 
loading an Anaconda module, there is an environment called custom which 
serves as an environment in which additional user-requested 
packages can be installed.
To switch to the custom environment, type::

  $ source activate custom

Other available Anaconda environments can be listed by::

  $ conda info --envs

If you need a package which is not available in any of the installed Anaconda 
modules or environments, contact PDC support.

Installing your own Python environment
----------------------------------------
If you need full control over your Python environment, we recommend that you
install your own Anaconda or Miniconda distribution, which is 
relatively easy. The Anaconda 
distribution is rather large and thus needs to be installed in your 
`/cfs/klemming/nobackup` directory, while Miniconda is much more lightweight.
Follow these links to find installation instructions for 
`Anaconda <https://www.continuum.io/downloads>`_ 
and `Miniconda <https://conda.io/miniconda.html>`_, respectively.

Using Anaconda Python on interactive node
-------------------------------------------

To use Anaconda Python on an interactive node on Tegner you first need to 
request the node and then log into it::

  $ salloc -A <your-project-ID> -t 1:0:0 -N 1
  salloc: Granted job allocation 596140
  salloc: Waiting for resource configuration
  salloc: Nodes t02n13 are ready for job

  # from separate terminal on your own machine:
  $ ssh t02n13.pdc.kth.se
  # load default Anaconda module:
  $ module load anaconda
  $ python some_script.py

On Beskow, you instead run Python on the allocated interactive node using 
the aprun command::

  $ salloc -A <your-project-ID> -t 1:0:0 -N 1
  $ module load anaconda
  $ aprun -n 1 python some_script.py

Using Anaconda Python in batch job
----------------------------------------

.. code-block:: bash

 #!/bin/bash -l
 # The -l above is required to get the full environment with modules

 # Set the allocation to be charged for this job
 # not required if you have set a default allocation
 #SBATCH -A 201X-X-XX

 # The name of the script is myjob
 #SBATCH -J myjob

 # Only 1 hour wall-clock time will be given to this job
 #SBATCH -t 1:00:00

 # Number of nodes
 #SBATCH --nodes=1

 #SBATCH -e error_file.e
 #SBATCH -o output_file.o

 # load the anaconda module
 module load anaconda/py35/4.2

 # if you need the custom conda environment:
 source activate custom

 # execute the program
 # (on Beskow use aprun instead)
 mpirun -n 1 python some_script.py

 # to deactivate the Anaconda environment
 source deactivate

