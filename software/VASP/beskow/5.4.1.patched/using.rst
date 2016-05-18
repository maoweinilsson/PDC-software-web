
General observations
--------------------

- Several bugs were reported for vasp.5.4.1.24Jun.15. The version installed on Beskow has been patched with all bugfixes up to November 15th, 2015. 
- VASP is not helped by hyper-threading (64 virtual cores per compute node).
- No GPU/OpenMP-support.
- Hybrid calculations (HSE06) seem to run a lot faster and use less memory compared with previous versoins
- The speed of standard DFT calculations seem unchanged.
- Running on fewer than 32 cores per node allocates more memory to each MPI task. This can in some cases improve performance and is necessary if your job crashes with an OOM error. See the example submit script below on how to do this correctly.

NPAR, NCORE and NSIM
--------------------

From initial testing, we recommended:

- NPAR = number of compute nodes
- NCORE = cores / node, typically 16,24 or 32.
- NSIM = 2
- KPAR = number of compute nodes (if applicable)


How to choose the number of cores
---------------------------------

Rule of thumb:

- 1 atom per core = Good
- 0.5 atom per core = Could work (but bad efficiency and time wasted)
- <0.5 atom per core = Don't do it

Explanation of above:

The number of bands is more important than the number of atoms, but typically
you have about 4 bands/atom in VASP.

To choose a good number of cores, you can use this checklist:

- Check how many you have in the calculation. Let's call this "NB".
- Cores = NB is best you can do.
- For better efficiency, typically 90%+, aim for at least 4 bands per core, i.e. Cores = NB/4
- If you can use k-point parallelization ("KPAR"), use it! It improves scaling a lot. You can run up to cores = #kpts * NB / 4.
- You have now determined the number of cores.
- Look at this number. Does it look "strange"? Try to adjust the number of
  bands to make the number of cores more even, .e.g we don't want a prime number.
  Good numbers are multiple of 4,8,12,16 etc. For example, 512 bands is better
  than 501 (=3x167).
- Calculate the number of nodes necessary, e.g. 512 cores (32 cores/node) = 16 compute nodes.
- For a wide calculation with less than 4 bands per core, try decreasing the
  number of cores/node to 24/c node, or even 16c/node. You may also have to do
  this get memory available for each MPI rank.

Vasp Filenames
--------------

- **vasp** : this is normal regular VASP version for calculations using >1 k-point.
- **vasp-gamma** : gamma-point only version of VASP. Use this one if you only have the gamma point. It is much faster and uses less memory.
- **vasp-noncollinear** : VASP for noncollinear and spin-orbit coupling calculations.

Running Vasp
------------

Load the appropriate module

``module load vasp/5.4.1.patched``

Loading **vasp module** module might generate a module conflict for **cray-mpich/7.0.4**. Go ahead and do  ``module sw cray-mpich/7.0.4 cray-mpich/7.2.2`` or ``module unload cray-mpich/7.0.4`` before loading **vasp module** again.


For an interactive run execute:

``srun -n <cores> vasp``


**OR** 

launch a job script (*vasp.run*) for a background execution  

``sbatch ./vasp.run`` 

Here is an example of a job script (*vasp.run*)

.. literalinclude:: files/vasp.run
    :language: bash

If your job requires a lot of memory it can be necessary to use fewer cores per node than the available 32. Here is an example of how to do this correctly using the -N flag to aprun, where a total of 64 cores distributed over 4 nodes (16 on each) are used

.. literalinclude:: files/vasp_mem.run
    :language: bash
