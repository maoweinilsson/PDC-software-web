:orphan:

.. include:: using.inc

To profile a binary with Allinea Performance Reports
we need to compile it with the module allinea-reports/5.0-40810 loaded::

  $ module load allinea-reports/5.0-40810
  $ export CRAYPE_LINK_TYPE=dynamic

We compile an example code::

  $ $SNIC_TMP
  $ mkdir apr-test
  $ cd apr-test
  $ cp /pdc/vol/allinea-reports/5.0-40810/examples/wave.c .
  $ cc wave.c -o wave.x

The binary ``wave.x`` is now instrumented for Allinea Performance Reports.

We run this using the following run script:

.. literalinclude:: files/run-perf-report
    :language: bash

This run generates two files::

  wave_32p_2015-02-13_20-02.html
  wave_32p_2015-02-13_20-02.txt

You can open the html file in a browser or the txt file directly in the terminal.

The html file will look like this:

.. image:: files/apr-example-summary.png
    :width: 500pt
