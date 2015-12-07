:orphan:

:doc:`../../../../index` - :doc:`../../index` - :doc:`index`


Using VASP 5.4.1 on Tegner
==========================


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



Building VASP 5.4.1 on Tegner
=============================



Obtain and untar the source. Download/apply latest patches
----------------------------------------------------------

	- ``patch -p1 < patch.5.4.1.08072015``
	- ``patch -p1 < patch.5.4.1.27082015``
	- ``patch -p1 < patch.5.4.1.06112015``

Copy makefile.include to the base directory
-------------------------------------------
.. literalinclude:: files/install.sh
    :language: bash

Load compiler, MPI, MKL, FFTW
-----------------------------

	- ``module load i-compilers/15.0.2``
	- ``module load intelmpi/5.0.3``
	- ``module load mkl/15.0.2``
	- ``module load fftw/3.3.4-intel-15.0.2-intelmpi-5.0.3-double``


Build; makefile is not parallel, but parallel build can be enforced by retrying until success
---------------------------------------------------------------------------------------------

	- ``srun -n 1 -d 24 -j 2 -cc none make -j 96 until !!; do :; done``

Modify the default binary names & create symbolic link
------------------------------------------------------
	- ``cd bin``
	- ``mv vasp_std vasp-regular``
	- ``mv vasp_ncl vasp-noncollinear``
	- ``mv vasp_gam vasp-gamma``
	- ``ln -s vasp-regular vasp``

