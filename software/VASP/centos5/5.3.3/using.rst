

Ferlin is an older machine, but also has vasp installed::

  $ module avail vasp

Load a specific version for use::

  $ module load vasp/5.3.3

Generally you will need prerequisites, for this inspect::

  $ module show vasp/5.3.3

Example job script:

.. literalinclude:: files/vasp.run
    :language: bash

We submit it with the following command (here for 2 nodes and 20 minutes)::

  $ module add easy
  $ esubmit -n2 -t20 ./vasp.run
