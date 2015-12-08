

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

