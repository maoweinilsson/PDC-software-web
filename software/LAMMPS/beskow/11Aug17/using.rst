There is a module for LAMMPS, which is loaded like any other module:

.. code-block:: bash

  module load lammps/VERSION

This will add the LAMMPS bin directory to your PATH, so that LAMMPS can be started with the command :code:`lmp`.

Below is an example batch script for a LAMMPS job in MPI mode:

.. literalinclude:: files/run.slurm
  :language: bash

This will run LAMMPS (:code:`lmp`) with 320 cores (10 nodes), and will read the input specified in :code:`infile` and write to :code:`outfile` in the directory the job was submitted. Submit the batch script with the :code:`sbatch` command, see also the `Beskow documentation <http://www.pdc.kth.se/resources/computers/beskow/how-to>`_.

LAMMPS has been built with the USER-OMP package, which provides multi-threaded versions of most pair styles, nearly all bonded styles, 
several Kspace styles, and a few fix styles, see the `documentation for USER-OMP <http://lammps.sandia.gov/doc/accelerate_omp.html>`_.
You may see a small performance advantage (5 to 20%) when running a USER-OMP style 
with a single thread per MPI task, versus running standard LAMMPS with its standard un-accelerated styles 
(in serial or all-MPI parallelization with 1 task/core). However, some performance variations have also been observed and benchmark 
simulations should always be performed. Below is an example to run LAMMPS in multithreaded mode with one thread per MPI rank:

.. literalinclude:: files/run_omp.slurm
  :language: bash

More information
----------------
For more information, refer to the `LAMMPS manual <http://lammps.sandia.gov/doc/Manual.html>`_.

