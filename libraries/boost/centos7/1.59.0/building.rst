
Download and extract::

  tar xvzf boost_1_59_0.tar.gz
  cd boost_1_59_0

We use the gcc version 4.8.4.

Then bootstrap::

  module add gcc/4.8.4
  module add openmpi/1.8-gcc-4.8
  ./bootstrap.sh --prefix=/afs/.pdc.kth.se/pdc/vol/boost/1.59.0/amd64_co7/gcc/4.8/

Then edit ``project-config.jam`` and insert the following line 
(note the space before the semicollons) ::

  using mpi ;


Then build and install::


  ./b2 install

Then we ran test::

  $ cd /afs/.pdc.kth.se/pdc/vol/boost/1.59.0/libs/mpi/test
  $ ../../../b2
