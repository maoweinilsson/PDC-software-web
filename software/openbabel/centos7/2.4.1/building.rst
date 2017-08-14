

Obtain and unpack the source
----------------------------

Obtain source from http://openbabel.org/wiki/Main_Page

Load compiler, MPI and cmake
-----------------------------

	- ``module load i-compilers/15.0.2``
	- ``module load cmake/3.5.1``


Build
-----

::
	
	cd /afs/.pdc.kth.se/pdc/vol/openbabel/2.4.1/src/build
	cmake -DCMAKE_INSTALL_PREFIX=/afs/.pdc.kth.se/pdc/vol/openbabel/2.4.1/amd64_co7/ ../openbabel-2.4.1/
	make -j2
	make test
	make install
