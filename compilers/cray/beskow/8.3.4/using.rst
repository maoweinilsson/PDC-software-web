:orphan:

.. include:: using.inc

When compiling on Beskow the cc/CC/ftn wrappers should always be
used. Which compiler is used is determined by which PrgEnv module is
loaded. e.g. to use the cray compiler PrgEnv-cray needs to be loaded, this is the default.

To use the cray compiler the cc/CC/ftn wrappers used, e.g. ::

  cc hello.c

It is then possible to see which version of the cray compiler is loaded using::

  cc -V

The versions available can be seen using ::

  module avail cce

The version required can then be loaded using for example ::

  module swap cce/8.3.4 cce/8.3.5

