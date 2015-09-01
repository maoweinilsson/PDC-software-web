

Download the source from http://www.mcs.anl.gov/petsc/download/index.html

The gcc version was 4.8.3.  Then configure and make with the commands

.. code-block:: bash
	
	./configure --prefix=/afs/.pdc.kth.se/pdc/vol/petsc/3.6.1/amd64_co7/complex/gcc/4.8.3/ PETSC_ARCH=arch-linux2-cxx-opt-complex --with-fortran-kernels=1 --with-cc=gcc --with-fc=gfortran --with-cxx=g++ --download-fblaslapack --download-mpich --with-scalar-type=complex --with-clanguage=cxx --download-fblaslapack=1 --download-metis --download-parmetis --download-superlu_dist --download-scalapack --download-mumps
	make
	make install


The module file:

.. code-block:: bash

	#%Module1.0

	set version [file tail [module-info name]]
	set name [file dirname [module-info name]]

	proc ModulesHelp { } {
    	puts stderr "This module sets the path and environment variables for petsc-3.6.1"
    	puts stderr "     see http://www.mcs.anl.gov/petsc/ for more information      "
    	puts stderr ""
	}
	module-whatis "PETSc - Portable, Extensible Toolkit for Scientific Computation"

	conflict petsc

	set petsc_dir   /pdc/vol/petsc/3.6.1/complex/gcc/4.8.3
	set petsc_arch  arch-linux2-cxx-opt-complex

	setenv PETSC_ARCH $petsc_arch
	setenv PETSC_DIR $petsc_dir
	prepend-path PATH /pdc/vol/petsc/3.6.1/complex/gcc/4.8.3/arch-linux2-cxx-opt-complex/bin:/pdc/vol/petsc/3.6.1/complex/gcc/4.8.3/bin
