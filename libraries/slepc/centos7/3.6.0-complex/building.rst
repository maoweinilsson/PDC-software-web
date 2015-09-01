This SLEPC is built using a specific petsc configuration.

Source is available from http://slepc.upv.es/download/download.htm

We load PETSC-complex:

.. code-block::
        
	module add petsc-complex

go into the source directory and set environment variable SLEPC_DIR to the working directory.  
We configured specifically with blopex and a prefix which requires us to specifically unset the environment variable PETSC_ARCH:

.. code-block::
        
	unset PETSC_ARCH
	./configure --prefix=/afs/.pdc.kth.se/pdc/vol/slepc/3.6.0/amd64_co7/complex/gcc/4.8.3 --download-blopex
	make
	make install
	make SLEPC_DIR=/afs/.pdc.kth.se/pdc/vol/slepc/3.6.0/amd64_co7/complex/gcc/4.8.3 PETSC_DIR=/pdc/vol/petsc/3.6.1/complex/gcc/4.8.3 PETSC_ARCH="" test
