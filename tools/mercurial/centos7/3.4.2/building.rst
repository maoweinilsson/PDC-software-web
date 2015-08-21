


Download the source from  `here <https://mercurial.selenic.com/>`_.  

Add the anaconda module

.. code-block:: bash
	
	module add anaconda/py27/2.1

and run 

.. code-block:: bash
	
	make install PREFIX=/afs/.pdc.kth.se/pdc/vol/mercurial/[VERSION]/[OS]/

You can test the installation with

.. code-block:: bash
	
	hg debuginstall