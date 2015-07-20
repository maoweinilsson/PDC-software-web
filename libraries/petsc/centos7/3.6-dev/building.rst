These are instructions to build the  development branch specifically needed for pflotran, see their instructions `instructions <https://bitbucket.org/pflotran/pflotran-dev/wiki/Installation/Linux>`_.

First clone the repository and checkout the correct branch

.. code-block:: bash
	
	git clone https://bitbucket.org/petsc/petsc petsc
	cd petsc
	git checkout c41c7662de68b036bda6be236f939e8b55959cb0

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
	
	make PETSC_DIR=/afs/pdc.kth.se/pdc/vol/petsc/c41c7662d/src/petsc PETSC_ARCH=arch-linux2-c-debug all
	make PETSC_DIR=/afs/pdc.kth.se/pdc/vol/petsc/c41c7662d/src/petsc PETSC_ARCH=arch-linux2-c-debug test
	make PETSC_DIR=/afs/pdc.kth.se/pdc/vol/petsc/c41c7662d/src/petsc PETSC_ARCH=arch-linux2-c-debug streams NPMAX=<number of MPI processes you intend to use>
