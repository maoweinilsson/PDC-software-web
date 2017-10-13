



There is a module for LAMMPS, which is loaded like any other module:

.. code-block:: bash

  module load lammps/VERSION

This will add the LAMMPS bin directory to your PATH, so that LAMMPS can be started with the command :code:`lmp`.
This command will point to the executable built with MPI, support for K80 GPUs and mixed-mode precision
(pair-wise forces are computed in single precision while accumulated forces are in double precision).
A serial executable is also available with the command :code:`lmp_serial`.

  
Below is an example batch script for a LAMMPS job:

.. literalinclude:: files/run.slurm
  :language: bash

This will run LAMMPS (:code:`lmp`) with 14 cores (on one node) and 2 K80 Tesla GPUs. 
It will read the input specified in :code:`in.lj` and write to :code:`log.lammps` in the directory the job was submitted. Submit the batch script with the :code:`sbatch` command, see also the `Tegner documentation <http://www.pdc.kth.se/resources/computers/tegner/how-to>`_.

Performance considerations
--------------------------
LAMMPS can run on both CPU cores and the K80 GPUs. With only MPI
parallelization, it is usually optimal to use all cores available,
but when using the K80 GPUs the performance should be tested with varying
number of CPU cores. For a test case with 130,000 atoms interacting with
Lennard-Jones forces, maximum performance was obtained by using the
two available K80 GPUs together with 8 CPU cores.


More information
----------------
For more information, refer to the `LAMMPS manual <http://lammps.sandia.gov/doc/Manual.html>`_.
