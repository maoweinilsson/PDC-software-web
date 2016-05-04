We mostly followed MatConvNet's  `install instructions <http://www.vlfeat.org/matconvnet/install/>`_.

.. code-block:: bash
	
	module add cuda/7.0
	module add matlab/r2105b
	cd /pdc/vol/matconvnet/1.0/src/matconvnet-1.0-beta19/
	matlab -nodisplay
	> addpath matlab
	> vl_compilenn('enableGpu', true)
	
The module file prepends the MATLABPATH environment variable to enable access to the library.

.. code-block:: bash

	/pdc/vol/matconvnet/1.0/src/matconvnet-1.0-beta19/matlab

We tested the installation using:

.. code-block:: bash

        module add cuda/7.0
	module add matlab/r2015b
	module add matconvnet/1.0
	matlab -nodisplay
	> run vl_setupnn
	> vl_testnn('gpu', true)
