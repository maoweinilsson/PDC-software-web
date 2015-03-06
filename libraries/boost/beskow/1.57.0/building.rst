:orphan:

.. include:: building.inc

Download and extract::

  tar xvzf boost_1_57_0.tar.gz
  cd boost_1_57_0

Set GNU environment::

  module swap PrgEnv-cray PrgEnv-gnu

Then create file ``user-config.jam`` which contains::

  using mpi : /opt/cray/craype/2.2.1/bin/CC : <find-shared-library>mpich ;
  using gcc : 4.9.1 : CC;

Then::

  ./bootstrap.sh --prefix=/pdc/vol/boost/1.57.0-gcc-4.9.1
  ./b2
  ./b2 install --prefix=/pdc/vol/boost/1.57.0-gcc-4.9.1
