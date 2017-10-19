Example run using siesta and transiesta:

.. code-block:: bash

  module add siesta/4.0.1
  salloc -N 1
  aprun -n 32 siesta < infil1.fdf
  aprun -n 32 transiesta < infil2.fdf

Loading the siesta/4.0.1 also prepends your PATH with the path to extra
utilities shipped with SIESTA (see /pdc/vol/siesta/4.0.1/Util/bin for all
available tools).

