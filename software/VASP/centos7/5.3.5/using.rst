

Tegner has vasp installed, to see which vasp versions are available use::

  $ module avail vasp

Load a specific version for use::

  $ module load vasp/5.3.5

This also loads the other modules required by vasp

Example job script:

.. literalinclude:: files/vasp.run
    :language: bash

We submit it with the following command ::

  $ sbatch ./vasp.run
