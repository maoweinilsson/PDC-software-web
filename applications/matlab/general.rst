:orphan:

.. include:: include.inc

**Matlab is installed on several of PDC's machines. In order to use Matlab you need a licenses.**

General usage
-------------

In order to use Matlab you need to have a Matlab license. In order to start Matlab you first need to pick the version you want and load that module, for instance:

.. code-block:: bash

 module avail matlab
 module add matlab/latest

Matlab should not be run using the graphical interface since you will be running on compute nodes (which don't have a screen attached...).

If you you want to run in batch mode you do:

.. code-block:: bash

  matlab -nojvm -nosplash -nodesktop < input.m > output.out

where input.m is your instructions to Matlab and output.out will be your output when running that script in Matlab.
If you are using  MATLAB Compiler or builder products run:

.. code-block:: bash

 mbuild -setup

from MATLAB before using these.

Distributed Compute Server
--------------------------

To use the Matlab Distributed Compute Server please see `this page <https://www.pdc.kth.se/resources/software/installed-software/restricted-software/matlab/matlab-dcs/matlab-distributed-compute-server-on-ferlin>`_. Currently DCS is only available on Ferlin.

External links
--------------

`Matlab information at the SNIC knowledge base <http://docs.snic.se/wiki/Matlab>`_


.. include:: ../../disclaimer.rst


