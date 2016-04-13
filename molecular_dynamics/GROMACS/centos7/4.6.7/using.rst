GROMACS is highly tuned for quite efficient use of HPC resources. Special assembly kernels make its core compute engine one of the fastest MD simulation programs.

In order to use GROMACS 4.6.7 with Plumed-2.2.1 support::

  $ module add gromacs/4.6.7-plumed

Module *gromacs/4.6.7-plumed* provides two versions of the GROMACS suite:

 * *mdrun_mpi* : The MD engine binary with MPI support and GPU support. This is the one that researchers would use most of the time.
 * *mdrun_mpi_d* : Same as above but in double precision and without GPU support. This one is much slower than the single precision *mdrun_mpi*. It is used only in special cases, such as Normal Mode analysis.

Here is an example script where we run on 1 Haswell node (24 processors in total). Do not run calculations on the login node for anything other than small short tests!!

.. literalinclude:: files/gromacs.run
    :language: bash

Another example for running on a Haswell node with a GPU, where we furthermore take advantage of multi-level parallelization with MPI and OpenMP is as follows: 

.. literalinclude:: files/gromacs-gpu.run
    :language: bash

Now we are ready to submit the calculation::

  $ sbatch gromacs.run
