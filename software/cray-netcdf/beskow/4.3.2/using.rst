
cray-netcdf on Beskow is supplied by Cray and is integrated into the
CC/cc/ftn script environment so to link programs against cray-netcdf it is
only necessary to have the correct cray-netcdf module loaded. For serial, eg

.. code-block:: bash

  module load cray-netcdf/4.3.2
  cc example.c

and for parallel hdf5, one should eg

.. code-block:: bash

  module load cray-netcdf-hdf5parallel/4.3.2
  cc example.c

The code should compile and link without needing any extra flags.
