:orphan:

.. include:: building.inc

module switch PrgEnv-{cray,gnu}
make PREFIX=/pdc/vol/ray/2.3.1 MAXKMERLENGTH=64 MPICXX=CC

#following might not be needed?
cp RayPlatform/{README.md,README}

make install

