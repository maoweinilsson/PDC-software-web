

First clone the repository and checkout the correct branch

.. code-block:: bash
	
	git clone https://bitbucket.org/petsc/petsc petsc
	cd petsc

Load the desired versions of required modules.  With gcc-4.8.2:

.. code-block:: bash
	
	module load openmpi/1.8-gcc-4.8
	module load hdf5/1.8.12-gcc-4.8
	module load mkl			# For blas/lapack

Then run the configure file with the path to blas/lapack

.. code-block:: bash
	
	./configure --with-blas-lapack-dir=/pdc/vol/i-compilers/15.0.2/mkl/lib/intel64

And follow the instructions given in the output. e.g.

.. code-block:: bash
	
	make PETSC_DIR=/afs/.pdc.kth.se/pdc/vol/petsc/3.6.1/amd64_co7/gcc/4.8.2 PETSC_ARCH=arch-linux2-c-debug all
	make PETSC_DIR=/afs/.pdc.kth.se/pdc/vol/petsc/3.6.1/amd64_co7/gcc/4.8.2 PETSC_ARCH=arch-linux2-c-debug test
	make PETSC_DIR=/afs/.pdc.kth.se/pdc/vol/petsc/3.6.1/amd64_co7/gcc/4.8.2 PETSC_ARCH=arch-linux2-c-debug streams NPMAX
	


The module file:

.. code-block:: bash

	#%Module1.0
	#
	# petsc
	#


	set name petsc
	set version 3.6.1
	set comp gcc
	set comp_v 4.8.2


	set home /pdc/vol/$name/$version/$comp/$comp_v

	if [module-info mode display] {
	    puts stderr "This module sets the path and environment variables for petsc-3.6.1"
	    puts stderr "     see http://www.mcs.anl.gov/petsc/ for more information      "
	    puts stderr ""

	}

	module load openmpi/1.8-gcc-4.8
	module load hdf5/1.8.12-gcc-4.8
	module load mkl

	set    petsc_dir        $home
	set    petsc_arch       arch-linux2-c-debug

	setenv  PETSC_DIR       $petsc_dir
	setenv  PETSC_ARCH      $petsc_arch

	module-whatis   "PETSc - Portable, Extensible Toolkit for Scientific Computation"

	prepend-path    PATH   $home/$petsc_arch/bin:$home/bin
