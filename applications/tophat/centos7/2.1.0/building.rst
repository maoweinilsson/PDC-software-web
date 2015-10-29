
::

  $ ./bootstrap
  $ ./configure --prefix=/afs/.pdc.kth.se/pdc/vol/tophat/2.1.0/amd64_co7

Check the dependencies. Tophat needs the boost library, which should be
installed prior of compiling tophat

::

  $ make
  $ make install
