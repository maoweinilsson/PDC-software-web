


To see what versions of NAMD are available on each machine use the command

.. code-block:: bash

  module avail namd

Running on Beskow
-----------------

To run on Beskow you need to first load the namd module then use the aprun command to start the namd2 program. e.g.

.. code-block:: bash

  module load namd/2.10
  aprun -n 48 namd2 input.namd

Where in this example:

    * input.namd is the name of the input file
    * 48 is the number of cores to use

If the aprun command is typed on the command line the job will be started on the interactive nodes. If not enough interactive nodes are currently available then a simple first in first out queue is used.

Example Job script

.. code-block:: bash

  #SBATCH -A XXXX-XX-XX
  #SBATCH -J namdjob
  #SBATCH -t 00:10:00
  #SBATCH --nodes=2
  #SBATCH --ntasks-per-node=32
  #SBATCH -e error.log
  #SBATCH -o output.log

  #load the NAMD module
  module add namd/2.10

  # Run namd
  aprun -n 64 namd2 input.namd > output_file

Note the number of MPI tasks must be set in two places. In the

.. code-block:: bash

  #SBATCH --nodes=2
  #SBATCH --ntasks-per-node=32

line and in the

.. code-block:: bash

  aprun -n 64 namd2 input.namd > output_file
 
line.

