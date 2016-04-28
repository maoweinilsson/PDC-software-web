General instructions for building pflotran can be found `here <https://mercurial.selenic.com/>`_.
Follow those to set up the special branch of PETSC then load Mercurial and download the source

.. code-block:: bash
	
	module load mercurial
	hg clone https://bitbucket.org/pflotran/pflotran-dev


Following the instructions to the letter does not work.  As this branch seems to assume a wrong directory structure.
Copying include/petsc/finclude to include/finclude is a workaround.

.. code-block:: bash

	cd pflotran/src/pflotran
	make pflotran