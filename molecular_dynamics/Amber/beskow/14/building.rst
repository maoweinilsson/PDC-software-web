The code has been installed using the following script:

.. literalinclude:: files/install.sh
    :language: bash

Also create the following symlink::

  $ ln -s MMPBSA.py MMPBSA.py.MPI

The script checks for the suffix in order to toggle mpi4py.
