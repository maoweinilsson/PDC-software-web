
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
which is installed at PDC and provided in several modules.
To list all available Anaconda modules, type::

   $ module avail anaconda

For example, to load Anaconda version 4.3 for Python 2.7, type::

   $ module load anaconda/py27/4.3

The Python version can be found by::

   $ python --version
   Python 2.7.13 :: Continuum Analytics, Inc.


The conda package manager can be used to list the packages installed in a given Anaconda module::

  $ conda list

In addition to the root environment, which is activated by default after 
loading an Anaconda module, there is an environment called custom which is 
meant to serve as an environment in which additional user-requested 
packages can be installed.
To switch to the custom environment, type::

  $ source activate custom

If you need a package which is not available in any of the installed Anaconda 
modules or environments (root or custom), contact PDC support.

Installing your own Python environment
----------------------------------------
If you need full control over your Python environment, we recommend that you
install your own Anaconda or Miniconda distributions, which is 
relatively easy. The Anaconda 
distribution is rather large and thus needs to be installed in your 
`/cfs/klemming/nobackup` directory, while Miniconda is much more lightweight.
Follow these links to find installation instructions for 
`Anaconda <https://www.continuum.io/downloads>`_ 
and `Miniconda <https://conda.io/miniconda.html>`, respectively.
