:orphan:


.. include:: using.inc


There is a module for LAMMPS, which is loaded like any other module:

.. code-block:: bash

  module load lammps

This will add the LAMMPS bin directory to your PATH, so that LAMMPS can be started with the command :code:`lmp`.

On Ferlin, use mpirun (the lammps module will automatically load intelmpi)

.. literalinclude:: files/run.sh
  :language: bash

Submit this batch script with :code:`esubmit`, see also the `Ferlin documentation <https://www.pdc.kth.se/resources/computers/ferlin/how-to>`_.

More information
----------------
For more information, refer to the `LAMMPS manual <http://lammps.sandia.gov/doc/Manual.html>`_.
