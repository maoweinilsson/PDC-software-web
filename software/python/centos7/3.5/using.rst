To list all available Anaconda modules on Beskow, type::

   $ module avail anaconda

For example, to load Anaconda version 4.2 for Python 3.5, type::

   $ module load anaconda/py35/4.2

After loading an Anaconda module, the Python version can be printed by::

   $ python --version
   Python 3.5.2 :: Anaconda 4.2.0 (64-bit)

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

Using Anaconda Python on interactive node
-------------------------------------------

To run Python on an interactive node on Tegner you first need to
request the node and then log into it from a new terminal on your local computer::

  $ salloc -A <your-project-ID> -t 1:0:0 -N 1
  salloc: Granted job allocation 596140
  salloc: Waiting for resource configuration
  salloc: Nodes t02n13 are ready for job

From separate terminal on your own machine::

  $ ssh t02n13.pdc.kth.se
  $ module load anaconda
  $ python some_script.py

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
 aprun -n 1 python some_script.py

 # to deactivate the Anaconda environment
 source deactivate
