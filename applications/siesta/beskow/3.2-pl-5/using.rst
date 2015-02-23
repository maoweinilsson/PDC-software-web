:orphan:

.. include:: using.inc

Here's an example way of running SIESTA on beskow, untested but it should work:

.. code-block:: bash

   module add siesta/3.2-pl-5
   salloc -n 32
   aprun -n 32 -t 3600 siesta < infil.fdf
