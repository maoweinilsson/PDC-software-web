

Load the module with::

  $ module load boost/1.59.0-gcc-4.8.4

The module prepends ``/pdc/vol/boost/1.59.0/amd64_co7/gcc/4.8.4/lib`` to ``LD_LIBRARY_PATH``
and sets ``BOOST_HOME=/pdc/vol/boost/1.59.0/amd64_co7/gcc/4.8.4``.

The include directory is then under ``$BOOST_HOME/include``.

As an example, we can compile and link a code (here ``hello.cpp``) like this::

  $ module add boost
  $ gcc -I$BOOST_HOME/include hello.cpp -L$BOOST_HOME/lib -lboost_system
