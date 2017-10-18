There are two modules of Julia v0.6.0, one is for the Haswell nodes and the other is for the Ivy Bridge nodes on Tegner. The details about the Hareware of Tegner can be found at 
https://www.pdc.kth.se/resources/computers/tegner/hardware

As an example, you can run Julia on a Haswell(thin) node on Tegner likes 

.. code-block:: bash

 t02n04$ module load julialang/0.6.0-haswell
 t02n04$ julia hello_world.jl 
   hello world
 
or on a Ivy Bridge (fet) node 

.. code-block:: bash

 t01n01$ module load julialang/0.6.0-ivybridge
 t01n01$ julia hello_world.jl
   hello world

