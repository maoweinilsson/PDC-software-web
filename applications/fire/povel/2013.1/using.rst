

Running using jobs that have been reserved with spattach is also possible, but
more complicated and not convered here.

To run in batch mode::

  $ module add easy
  $ esubmit -n 2 -t 60 ./job.sh

will submit a job on 2 nodes (48 cores on Povel and 16 cores on Ferlin) with a
duration of 60 minutes.

Sample job file:

.. literalinclude:: files/run_script.sh
    :language: bash
