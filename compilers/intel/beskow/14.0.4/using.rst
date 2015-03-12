

When compiling on Beskow the cc/CC/ftn wrappers should always be
used. Which compiler is used is determined by which PrgEnv module is
loaded. e.g. to use the intel compiler PrgEnv-intel needs to be loaded
e.g. by doing::

  module swap PrgEnv-cray PrgEnv-intel

To use the intel compiler icc, icpc or ifortran should not be called
directly, but the wrappers used instead, e.g. ::

  cc hello.c

It is then possible to see which version of the intel compiler is loaded using::

  cc --version

The versions available can be seen using ::

  module avail intel

The version required can then be loaded using for example ::

  module swap intel/14.0.4.211 intel/15.0.1.133

