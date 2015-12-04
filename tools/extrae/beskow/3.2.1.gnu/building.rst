
Download and untar the source and dependecies
---------------------------------------------

**extrae**  ::
	
	https://www.bsc.es/computer-sciences/performance-tools/downloads

**binutils** :: 

	git clone git://sourceware.org/git/binutils-gdb.git

**libunwind** ::

	git clone git://git.sv.gnu.org/libunwind.git



Install binutils
----------------
::

	cd into_binutils_install_dir
	mv binutils-gdb/ src/
	cd src
	./configure --prefix=$PWD/.. --enable-shared
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
==============

	- ``module sw cray-mpich/7.0.4 cray-mpich/7.2.5``


Load appropiate programing environment 
--------------------------------------

	- **gnu** ``module load PrgEnv-gnu``
	- **cray** ``module load PrgEnv-cray``
	- **intel** ``module load PrgEnv-intel``


Force cray to build using dynamic libraries	

	- ``export CRAYPE_LINK_TYPE=dynamic``

Create an copiler dependent install.sh similar to this ones 
-----------------------------------------------------------
	- **gnu** .. literalinclude:: files/install_gnu.sh: language: bash
	- **cray** .. literalinclude:: files/install_cray.sh: language: bash
	- **intel** .. literalinclude:: files/install_intel.sh: language: bash

Untar, run configure, make and make install extrae
--------------------------------------------------
::	

	cd into_extrae_install_dir
	mkdir 3.2.1/beskow/gnu
	tar -xvf extrae.tar -C into_etrae_install_dir/3.2.1/beskow/src
	cd into_etrae_install_dir/3.2.1/beskow/src
	vim install.sh
	source install.sh
	make 
	make install

