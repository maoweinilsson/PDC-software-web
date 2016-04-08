The installation file can be downloaded from `here <https://github.com/sebhtml/Ray-Releases/blob/master/Ray-2.3.1.tar.bz2>`_.::

  $module switch PrgEnv-{cray,gnu}
  $make PREFIX=/pdc/vol/ray/2.3.1 MAXKMERLENGTH=64 MPICXX=CC HAVE_LIBZ=y MPI_IO=y

  $#following might not be needed?
  $cp RayPlatform/{README.md,README}

  $make install

