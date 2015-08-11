
Download and extract::

  tar xvzf boost_1_58_0.tar.gz
  cd boost_1_58_0

We'll use the system gcc version 4.8.3.

Then bootstrap::

  module add openmpi/1.8-gcc-4.8
  ./bootstrap.sh --prefix=/pdc/vol/boost/1.58.0/amd64_co7/gcc-4.8.3

Then edit ``project-config.jam`` and insert the following two lines::

  using mpi ;
  using gcc ;

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
  ./b2 install --prefix=/pdc/vol/boost/1.58.0/amd64_co7/gcc-4.8.3
