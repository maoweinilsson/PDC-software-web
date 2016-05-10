

How to use Python on PDC machines
===================================

Multiple versions of python are installed on PDC machines.

To see which version of python is available by default use the command::

  python -V

You can also see what other versions of python are available using::

  module avail python 

Available python packages
=========================

Python has a very large number of optional packages that can be
installed. These are accessed using the site-python module. If the
specific package you need is not installed then `contact support <https://www.pdc.kth.se/about/contact/support-requests>`_.

You can see which versions of python have site python components using::

  module avail site-python

Then load a specific site python module (corresponding to the version
of python you want to use) using for example::

  module load site-python/2.6

Anaconda
========

Anaconda is an enterprise-ready Python distribution for large-scale
data processing, predictive analytics, and scientific computing. It
includes Python packages for science, math, engineering and data
analysis.

It is now available on all PDC systems and provides the Python
interpreter for various versions of python. 

You can see which python versions are supported using::

  module avail anaconda

The following output::

  ------------ /pdc/modules/system/base ------------ 
  anaconda/py27/1.8 anaconda/py33/1.8 

shows that anaconda is available for python 2.7 and 3.3

There are acceleration packages as part of anaconda that can make use
of Intel's MKL library as well as of acceleration by GPUs.

To use anaconda just load the module and start the Python interpreter::

  $ module load anaconda/py27/1.8
  $ python
  Python 2.7.6 |Anaconda 1.8.0 (64-bit)| (default, Nov 11 2013, 10:47:18)
  [GCC 4.1.2 20080704 (Red Hat 4.1.2-54)] on linux2
  Type "help", "copyright", "credits" or "license" for more information.
  >>>

To make the python executable link to the correct Anaconda libraries, 
add this command to your interactive session or submit script::

  $ source activate_python

Canopy
------

Canopy (also known as EPD) provides an open and intuitive environment
for scientific and analytic computing for a comprehensive,
Python-based analysis desktop & Python distribution.

It is also available at all PDC systems, but (but only for python
2.7). Load the module and use it as follows::

  $ module load canopy/1.1
  $ python
  Enthought Canopy Python 2.7.3 | 64-bit | (default, Aug  8 2013, 05:43:23) 
  [GCC 4.1.2 20080704 (Red Hat 4.1.2-52)] on linux2 
  Type "help", "copyright", "credits" or "license" for more information. 
  >>>

