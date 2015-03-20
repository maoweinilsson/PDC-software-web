
cray-petsc on Beskow is supplied by Cray and is integrated into the
CC/cc/ftn script environment so to link programs against cray-petsc it is
only necessary to have the correct cray-petsc module loaded. For real
arithmetic, eg

.. code-block:: bash

  module load cray-petsc/3.4.4.0
  cc example.c

and for complex arithmetic, one should eg

.. code-block:: bash

  module load cray-petsc-complex/3.4.4.0
  cc example.c

The code should compile and link without needing any extra flags.
