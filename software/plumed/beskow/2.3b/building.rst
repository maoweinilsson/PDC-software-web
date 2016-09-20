This version is compiled with support for ALMOST (http://www-almost.ch.cam.ac.uk/site/almost.html).

First fetch and build plumed::

  $ tar xvfz plumed-2.3b.tgz
  $ cd plumed
  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module load almost/2.1
  $ export CRAYPE_LINK_TYPE=dynamic
  $ ./configure --prefix=/pdc/vol/plumed/2.3b CXX=CC CC=cc --enable-almost CPPFLAGS="-I/pdc/vol/almost/2.1/include -I/pdc/vol/almost/2.1/include/almost" LDFLAGS="-L/pdc/vol/almost/2.1/lib"
  $ make -j 4 install

Check it runs::

  $ /pdc/vol/plumed/2.3b/bin/plumed -h
