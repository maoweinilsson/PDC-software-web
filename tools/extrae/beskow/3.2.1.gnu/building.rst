
Download and untar the source and dependecies
----------------------------------------------------------

**extrae**  ::
	
	https://www.bsc.es/computer-sciences/performance-tools/downloads

**binutils** :: 

	git clone git://sourceware.org/git/binutils-gdb.git

**libunwind** ::

	git clone git://git.sv.gnu.org/libunwind.git


Unload unnecessary or old modules to avoid conflicts
----------------------------------------------------

	- ``module unload PrgEnv-cray``


Load GNU programing environment 
-------------------------------

	- ``module load PrgEnv-gnu``

Install binutils
----------------
::

	cd into_binutils_install_dir
	mv binutils-gdb/ src/
	cd src
	./configure --prefix=$PWD/..
	make 
	make install
	export BINUTILS_DIR=$PWD


Install libunwind
-----------------
::

	cd into_libunwind_install_dir
	mv libunwind/ src/
	cd src
	./autoconf --prefix=$PWD/..
	./configure --prefix=$PWD/..
	make 
	make install
	export LIBUNWIND_DIR=$PWD



Install Extrae
--------------
Create an install.sh similar to this one 

.. literalinclude:: files/install.sh
    :language: bash

Untar, run configure, make and make install extrae
::	

	cd into_extrae_install_dir
	mkdir 3.2.1/beskow/gnu
	tar -xvf extrae.tar -C into_etrae_install_dir/3.2.1/beskow/src
	cd into_etrae_install_dir/3.2.1/beskow/src
	vim install.sh
	source install.sh
	make 
	make install

