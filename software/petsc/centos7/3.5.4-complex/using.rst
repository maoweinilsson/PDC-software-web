
It is necessary to have the correct petsc module loaded. For complex arithmetic, one should e.g.

.. code-block:: bash

  module load petsc-complex/3.5.4-intelmpi-5.0.3-avx2
  mpicc example.c

Notice that this version is only built for the Intel Haswell nodes with AVX2 on Tegner. You need to add slurm flag *-C Haswell* to specify the nodes, see `The hardware of Tegner <https://www.pdc.kth.se/resources/computers/tegner/hardware>`_ .
 
Formation on how to submit jobs on Tegner, see `Job Submission on Tegner <https://www.pdc.kth.se/resources/computers/tegner/how-to/run>`_ .

