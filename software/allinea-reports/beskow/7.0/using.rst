To profile a code with Allinea Performance Reports we need to compile it with the module allinea-reports/7.0 loaded::

  $ module load allinea-reports/7.0

If a change of the environment is necessary, make sure you perfom it **before** loading the *allinea-reports/7.0* module. For example ::

	$ module sw PrgEnv-cray PrgEnv-intel
	$ module load allinea-reports/7.0

Changing the environment after loading the allinea-reports module will result in a error when compling the code. 

Running example
_______________

On Beskow the program must either be dynamically linked (using -dynamic) or explicitly linked with the Allinea profiling libraries.


Here is an example from the official documentation ::

  $ cd $SNIC_TMP
  $ mkdir apr-test
  $ cd apr-test
  $ cp /pdc/vol/allinea-reports/7.0/examples/wave.c .
  $ cc wave.c -o wave.x

The binary ``wave.x`` is now instrumented for Allinea Performance Reports.

In order to run you must prepend the *aprun* command in your bash scipt or interactive run with **perf-report**. Here is a simple script that runs the example compiled above:

.. literalinclude:: files/run-perf-report
    :language: bash

The run will generate two additional files next to the normal output of the profiled application, namely::

  <app>_<cores>p_<date-stamp>_<time-stamp>.html
  <app>_<cores>p_<date-stamp>_<time-stamp>.txt

You can open the **html** file in a browser or the **txt** file directly in the terminal.

The html file will look similar to this one:

.. image:: files/apr-example-summary.png
    :width: 500pt
