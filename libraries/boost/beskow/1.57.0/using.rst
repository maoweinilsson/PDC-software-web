:orphan:

.. include:: using.inc

Load the module with::

  $ module load boost/1.57.0-gcc-4.9.1

The module prepends ``/pdc/vol/boost/1.57.0-gcc-4.9.1/lib`` to ``LD_LIBRARY_PATH``
and sets ``BOOST_HOME=/pdc/vol/boost/1.57.0-gcc-4.9.1``.

The include directory is then under ``$BOOST_HOME/include``.

As an example, we can compile and link a code (here ``hello.cpp``) like this::

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add boost
  $ CC -I$BOOST_HOME/include hello.cpp -L$BOOST_HOME/lib -lboost_system
