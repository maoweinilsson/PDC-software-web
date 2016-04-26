
Source Berkeley UPC runtime can be downloaded from
http://upc.lbl.gov/download/source.shtml#runtime

::

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ cd [build]
  $ <path-to-src>/configure CC=cc CXX=CC MPI_CC=CC prefix=/pdc/vol/upcc/2.22.0/install --disable-pshm
  $ make
  $ make install prefix=/pdc/vol/upcc/2.22.0/install
