

**Matlab is installed on several of PDC's machines. The Matlab license from your home institution will be used when you run Matlab at PDC. In addition there is a national license for Matlab Distributed COmpute Server that can be used to run Matlab in Parallel**

General usage
-------------

In order to use Matlab you need to have a Matlab license. In order to start Matlab you first need to pick the version you want and load that module, for instance:

.. code-block:: bash

 module avail matlab
 module add matlab/latest

Matlab should not be run using the graphical interface since you will be running on compute nodes (which don't have a screen attached...).

If you you want to run in batch mode you do:

.. code-block:: bash

  matlab -nosplash -nodesktop < input.m > output.out

where input.m is your instructions to Matlab and output.out will be your output when running that script in Matlab.
If you are using  MATLAB Compiler or builder products run:

.. code-block:: bash

 mbuild -setup

from MATLAB before using these.



External links
--------------

`Information on running parallel matlab from Mathworks <http://se.mathworks.com/programs/resource-portals/mdcs-resources-for-hpc/index.html>`_
`Matlab information at the SNIC knowledge base <http://docs.snic.se/wiki/Matlab>`_




