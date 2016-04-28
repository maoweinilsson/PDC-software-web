Example script for a parallel execution of ``MMPBSA.py``:

.. literalinclude:: files/MMPBSA.sbatch
    :language: bash

The script calls ``MMPBSA.sh``:

.. literalinclude:: files/MMPBSA.sh
    :language: bash

The Anaconda environment is needed for the ``mpi4py`` functionality
inside ``MMPBSA.py``.
