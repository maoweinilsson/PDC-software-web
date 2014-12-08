:orphan:


.. include:: running.inc


About Allinea Performance Reports
=================================

Allinea Performance Reports (APR) is a convenient tool
to characterize and understand the performance of HPC application runs.

It generates a clear single-page HTML report answering the following questions:
  - Is this application well-optimized for the system it is running on?
  - Does it benefit from running at this scale?
  - Are there I/O or networking bottlenecks affecting performance?
  - Which hardware, software or configuration changes can we make to improve performance further.


Support
-------

Support for APR
is available either via `regular PDC support <https://www.pdc.kth.se/about/contact/support-requests>`_,
or directly from `Allinea <http://www.allinea.com/contact-us>`_.


External links
--------------

  - http://www.allinea.com/products/performance


Allinea Performance Reports on Lindgren
=======================================

Example calculation
-------------------

We will demonstrate the tool using an example source file (wave.c)
that is shipped with the APR installation.

For this we create a temporary directory where we will run the test::

  mkdir $SNIC_TMP/apr-test
  cd $SNIC_TMP/apr-test

We copy the example source file to the temporary directory::

  cp /pdc/vol/allinea-pr/4.2/examples/wave.c .

Then we compile and run it (so far without APR)::

  cc -O3 wave.c -o wave.x
  aprun -n 24 -t 40 ./wave.x

It should produce an output similar to this one::

  Wave solution running with 24 processes

  0: points = 1000000, running for 30 seconds
  points / second: 2068.5M (86.2M per process)
  compute / communicate efficiency: 97% | 98% | 100%

  Points for validation:
  0:0.00  200000:0.94  400000:0.58  600000:-0.58  800000:-0.94  999999:0.00
  wave finished
  Application 2121805 resources: utime ~717s, stime ~2s


Instrumenting the binary
------------------------

Now we wish to analyze the performance using APR.

First we load the necessary module::

  module load allinea-pr/4.2

For this we need to generate instrumentation libraries::

  make-map-cray-libraries

This creates the following libraries in $SNIC_TMP/apr-test::

  libmap-sampler.so
  libmap-sampler-pmpi.so

We will use these libraries to relink our code (we give the executable a different name)::

  cc -O3 wave.c -o wave-apr.x -dynamic -L$SNIC_TMP/apr-test -lmap-sampler-pmpi -lmap-sampler -Wl,--eh-frame-hdr

Note that the compilation only differs in the linking.  To instrument a large
code project it is not necessary to recompile the code, only the link line
needs to be edited with the generated MAP libraries. Note that the MAP
libraries are dependent on the selected compiler environment on Lindgren.

Now we have an instrumented binary wave-apr.x.


Running perf-report
-------------------

Before running the performance report we need to export the following variables::

  export LD_LIBRARY_PATH=$SNIC_TMP/apr-test:$LD_LIBRARY_PATH
  export CRAY_ROOTFS=DSL

We are now ready to run the binary through APR.
For this we prepend it with perf-report::

  perf-report aprun -n 24 -t 40 ./wave-apr.x

The run produces two files (actual date will differ of course)::

  wave-apr_24p_2014-06-05_17-29.html
  wave-apr_24p_2014-06-05_17-29.txt

They contain the same information, either in TXT format or in shiny HTML format
that you can open in any browser.


Analyzing the result
--------------------

We can look at the HTML output in the
screenshot pasted below. The report gives a nice and clear overview about
possible bottlenecks at the CPU, MPI, I/O, and Memory level. There is no I/O in
this example. We can see that the total MPI wall clock time is only 6% of the
total execution time. This value would go up if we execute the binary on more
and more nodes (please try).  Now you are ready to instrument and measure your
own code.

.. image:: apr-example-summary.png
