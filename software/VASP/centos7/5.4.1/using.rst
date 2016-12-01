
General observations
--------------------

- The version installed on Tegner has been patched with all bugfixes up to November 15th, 2015. 
- VASP is not helped by hyper-threading (48/96 virtual cores per compute node).
- No GPU/OpenMP-support.
- Hybrid calculations (HSE06) seem to run a lot faster and use less memory compared with previous versions
- The speed of standard DFT calculations seem unchanged.

Vasp Filenames
--------------

- **vasp** : this is normal regular VASP version for calculations using >1 k-point.
- **vasp-gamma** : gamma-point only version of VASP. Use this one if you only have the gamma point. It is much faster and uses less memory.
- **vasp-noncollinear** : VASP for noncollinear and spin-orbit coupling calculations.

Using vdW functionals
--------------------

To use one of the nonlocal vdW functionals one needs to put the file vdw_kernel.bindat into the run directory (along with INCAR, POSCAR, POTCAR and KPOINTS). This file can be copied to your directory like this:

``cp /pdc/vol/vasp/data/vdw_kernel.bindat .``

Running Vasp
------------

Load the appropriate module

``module load vasp/5.4.1``

Loading **vasp module** module might generate module conflicts if other MPI or FFTW library modules are loaded. Unload the conflicting modules and load **vasp module** again.


For an interactive run execute 

``srun -n <cores> vasp``


**OR** 

launch a job script (*vasp.run*) for a background execution  

``sbatch ./vasp.run`` 

Here is an example of a job script (*vasp.run*)

.. literalinclude:: files/vasp.run
    :language: bash


