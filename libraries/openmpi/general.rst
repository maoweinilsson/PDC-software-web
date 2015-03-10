:orphan:

.. include:: include.inc


Using OpenMPI at PDC
--------------------

`OpenMPI <http://www.open-mpi.org>`_ is an open source Message Passing
Interface implementation that is developed and maintained by a consortium of
academic, research, and industry partners.

To see which versions of OpenMPI are available use::

  module avail openmpi


Recommended versions
--------------------

The general rule is to use the highest offered version of MPI and the
associated compiler that is given in the module name. For example, the module
openmpi/1.4.4-gcc-4.6 can be used with all subversions of the GNU compiler
version 4.6, the module openmpi/1.4.4-intel-12 works with all subversions of
Intel's compiler version 12. The support should be contacted in the case of
problems using such combinations or if specific combinations are needed.
