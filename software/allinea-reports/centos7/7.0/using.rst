Load the appropiate compilers and the module allinea-reports/6.1 ::

  $ module load i-compilers
  $ module load intelmpi 
  $ module load allinea-reports/7.0

Running example
_______________

Here is an example from the official documentation ::

  $ mkdir apr-test
  $ cd apr-test
  $ cp /pdc/vol/allinea-reports/6.1/examples/wave.c .
  $ mpiicc  wave.c -o wave.teg

The binary ``wave.teg`` is now instrumented for Allinea Performance Reports.

In order to run you must prepend the *mpirun* command in your bash scipt or interactive run with **perf-report**. Here is a simple script that runs the example compiled above:

.. literalinclude:: files/run-perf-report
    :language: bash

The run will generate two additional files next to the normal output of the profiled application, namely::

  <app>_<cores>p_<date-stamp>_<time-stamp>.html
  <app>_<cores>p_<date-stamp>_<time-stamp>.txt

You can open the **html** file in a browser or the **txt** file directly in the terminal.

The html file will look similar to this one:

.. image:: files/apr-example-summary.png
    :width: 500pt
