Load the module ::

  $ module load globus-toolkit/6.0

Running example
_______________

The Globus Toolkit provides a GridFTP client called **globus-url-copy**, a command line interface, suitable for scripting. For example, the following command ::
    $ globus-url-copy gsiftp://remote.host.edu/path/to/file file:///path/on/local/host

would transfer a file from a remote host to the locally accessible path specified in the second URL.





The binary ``wave.teg`` is now instrumented for Allinea Performance Reports.

In order to run you must prepend the *mpirun* command in your bash scipt or interactive run with **perf-report**. Here is a simple script that runs the example compiled above:


.. image:: files/apr-example-summary.png
    :width: 500pt
