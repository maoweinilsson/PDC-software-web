General instructions for using MatConvNet can be found `here <http://www.vlfeat.org/matconvnet/>`_.
In order to use it on PDC's systems cuda and matlab needs to be loaded:

.. code-block:: bash
	
	module load cuda/7.0
	module load matlab/r2015b
	module load matconvnet/1.0

Next you can start Matlab or run any script that uses MatConvNet, e.g.

.. code-block:: bash

	matlab -nodisplay
	> vl_testnn('gpu', true)
