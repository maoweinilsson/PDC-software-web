

DDT is a debugger developed by
`Allinea <http://www.allinea.com/products/ddt/>`_.


Support
-------

As well as via normal
`PDC support <https://www.pdc.kth.se/about/contact/support-requests>`_,
support for DDT is also available directly from ``support@allinea.com``.


General usage
-------------

In order to start DDT you first need to pick the version you want and load that module, for instance::

  module avail ddt
  module add ddt/latest

Your codes (C, C++, Fortran etc.) should be compiled with debugging option
(e.g. -g) before using DDT. Note that the compiler(s) and libraries employed
for DDT should be same as these for compiling the codes.

Notice that there are two different file systems on PDC
computers (AFS and CFS). Running DDT on different file systems and different computers may
lead to conflict of configurations. In most cases, using command::

  ddt -cleanconfig

or copying the default configuration file ``/pdc/vol/ddt/3.2.1/config.ddt`` to
``~/.ddt/config.ddt`` may fix these problems. However in some cases,
unfortunately you should have to manually set up parameters and configurations.

Dependent on the size of your problems, there are usually three ways to run:

 - Interactive DDT with GUI on interactive nodes
 - Interactive DDT with GUI with queuing systems
 - DDT offline within a job script


Useful options
--------------

``-help``: display this help and exit

``-cleanconfig``: remove any user-specific settings

``-log FILE``: create a log file

``-start``: run program immediately

``-noqueue``: disable the queue for this run of DDT
