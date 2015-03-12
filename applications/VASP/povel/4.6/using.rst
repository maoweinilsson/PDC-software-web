

Ferlin is an older machine, but also has vasp installed::

  $ module avail vasp

Load a specific version for use::

  $ module load vasp/4.6

Generally you will need prerequisites, for this inspect::

  $ module show vasp/4.6

Example job script:

.. literalinclude:: files/vasp.run
    :language: bash

We submit it with the following command (here for 2 nodes and 20 minutes)::

  $ module add easy
  $ esubmit -n2 -t20 ./vasp.run
