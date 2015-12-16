

How to use OpenFOAM on PDC machines
===================================

Openfoam is a free, open source CFD software package.
See also http://www.openfoam.org.


To see which versions of openfoam are installed on any of the machines at PDC log into the machine and type

.. code-block:: bash

 module avail openfoam

You should consider questions before running openFOAM such as:

 How often do you save your solution?
 What trace/history of your iterations do you write to file(s)?

To control this behavior you need to modify the corresponding parameters in

.. code-block:: bash
 
 controlDict

Moreover you can adapt your simulation to Beskow by tweaking the following parameters:

.. code-block:: bash

 writeCompression                    uncompressed;
 runTimeModifiable                   no;
