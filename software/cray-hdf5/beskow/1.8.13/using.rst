
cray-hdf5 on Beskow is supplied by Cray and is integrated into the
CC/cc/ftn script environment so to link programs against cray-hdf5 it is
only necessary to have the correct cray-hdf5 module loaded. For serial, eg

.. code-block:: bash

  module load cray-hdf5/1.8.13
  cc example.c

and for parallel, one should eg

.. code-block:: bash

  module load cray-hdf5-parallel/1.8.13
  cc example.c

The code should compile and link without needing any extra flags.
