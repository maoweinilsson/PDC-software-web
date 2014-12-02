:orphan:

Here's an example way of running SIESTA on Milner

.. code-block:: bash

   module add siesta/3.2-pl-5
   salloc -n 20   
   aprun -n 20 -t 3600 siesta < infil.fdf 
   siesta
