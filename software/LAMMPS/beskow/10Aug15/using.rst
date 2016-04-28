



There is a module for LAMMPS, which is loaded like any other module:

.. code-block:: bash

  module load lammps/VERSION

This will add the LAMMPS bin directory to your PATH, so that LAMMPS can be started with the command :code:`lmp`.

Below is an example batch script for a LAMMPS job:

.. literalinclude:: files/run.slurm
  :language: bash

This will run LAMMPS (:code:`lmp`) with 320 cores (10 nodes), and will read the input specified in :code:`infile` and write to :code:`outfile` in the directory the job was submitted. Submit the batch script with the :code:`sbatch` command, see also the `Beskow documentation <http://www.pdc.kth.se/resources/computers/beskow/how-to>`_.

More information
----------------
For more information, refer to the `LAMMPS manual <http://lammps.sandia.gov/doc/Manual.html>`_.
