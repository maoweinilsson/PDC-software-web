


As an example, we can compile and link a code (here ``hello.cpp``) like this::

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add boost
  $ CC -I$BOOST_HOME/include hello.cpp -L$BOOST_HOME/lib -lboost_system
