:orphan:

.. include:: using.inc

The specific installations of VASP are found below under::

  /pdc/vol/vasp/version/buildtag/vasp-*

If you want to run the latest recommended installation of VASP, run like this::

  aprun ... /pdc/vol/vasp/5.3.5-31Mar14/default/vasp


General observations
--------------------

- VASP is not helped by hyper-threading (64 virtual cores per compute node).
- In fact, I would recommend using only 24 cores per compute for large calculation (say > 16 nodes). It is likely to be faster and consume less memory than 32 cores/node.
- VASP is not OpenMP aware. Enabling OpenMP-threads in Intel MKL does not help either.
- Enabling hugepages for memory does not seems to benefit VASP.


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
