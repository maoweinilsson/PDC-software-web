

Obtain and untar the source. Download/apply latest patches
----------------------------------------------------------

	- ``patch -p1 < patch.5.4.1.08072015``
	- ``patch -p1 < patch.5.4.1.27082015``
	- ``patch -p1 < patch.5.4.1.06112015``

Copy makefile.include to the base directory
-------------------------------------------

.. literalinclude:: files/install.sh
    :language: bash

Unload unnecessary or old modules to avoid conflicts
----------------------------------------------------

	- ``module unload PrgEnv-cray``
	- ``module unload cray-mpich``
	- ``module unload cray-libsci``

Load compiler, MPI, FFTW
------------------------

	- ``module load PrgEnv-intel/5.2.56``
	- ``module swap intel intel/15.0.2.164``
	- ``module load cray-mpich/7.2.2``
	- ``module load fftw/3.3.4.3``


Use hugepages to avoid permormance degradation
----------------------------------------------	

	- ``module load craype-hugepages2M``

Use a previous version of MKL for the moment due to missing scalapack
-----------------------------------------------------------------------

	- ``export MKLROOT=/opt/intel/composer_xe_2013_sp1.4.211/mkl``
	- ``export FFTW_PATH=/opt/cray/fftw/3.3.4.3/haswell/lib``

Build; makefile is not parallel, but parallel build can be enforced by retrying until success
---------------------------------------------------------------------------------------------

	- ``aprun -n 1 -d 32 -j 2 -cc none make -j 64``
	- ``until !!; do :; done``

Modify the default binary names & create symbolic link
------------------------------------------------------

	- ``cd bin``
	- ``mv vasp_std vasp-regular``
	- ``mv vasp_ncl vasp-noncollinear``
	- ``mv vasp_gam vasp-gamma``
	- ``ln -s vasp-regular vasp``

For debugging with ATP
----------------------

	- ``export ATP_ENABLED=1``



