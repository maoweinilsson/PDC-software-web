
Download and extract::

  tar xvzf boost_1_57_0.tar.gz
  cd boost_1_57_0

Set GNU environment::

  module swap PrgEnv-cray PrgEnv-gnu

Then bootstrap::

  ./bootstrap.sh --prefix=/pdc/vol/boost/1.57.0-gcc-4.9.1

Then edit ``project-config.jam`` and insert the following two lines::

  using mpi : /opt/cray/craype/2.2.1/bin/CC : <find-shared-library>mpich ;
  using gcc : 4.9.1 : CC ;

right before this block::

  # Compiler configuration. This definition will be used unless
  # you already have defined some toolsets in your user-config.jam
  # file.
  if ! gcc in [ feature.values <toolset> ]
  {
      using gcc ;
  }

The in principle nicer solution of editing ``user-config.jam`` was ignored
by the configure scripts (?).

Then build and install::

  ./b2
  ./b2 install --prefix=/pdc/vol/boost/1.57.0-gcc-4.9.1
