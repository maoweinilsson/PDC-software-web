
General observations
--------------------

- Several bugs were reported for vasp.5.4.1.24Jun.15. The verision installed on Beskow has been patched with all bugfixes up to November 15th, 2015. 
- VASP is not helped by hyper-threading (64 virtual cores per compute node).
- No GPU/OpenMP-support.
- Hybrid calculations (HSE06) seem to run a lot faster and use less memory compared with previous versoins
- The speed of standard DFT calculations seem unchanged.

Vasp Filenames
--------------

- **vasp** : this is normal regular VASP version for calculations using >1 k-point.
- **vasp-gamma** : gamma-point only version of VASP. Use this one if you only have the gamma point. It is much faster and uses less memory.
- **vasp-noncollinear** : VASP for noncollinear and spin-orbit coupling calculations.

Running Vasp
------------

Load the appropriate module

``module load vasp/5.4.1.patched``

Loading **vasp module** module might generate a module conflict for **cray-mpich/7.0.4**. Go ahead and do  ``module sw cray-mpich/7.0.4 cray-mpich/7.2.2``  and load **vasp module** again.


For an interactive run execute 

``srun -n <cores> vasp``


**OR** 

launch a job script (*vasp.run*) for a background execution  

``sbatch ./vasp.run`` 

Here is an example of a job script (*vasp.run*)

.. literalinclude:: files/vasp.run
    :language: bash


