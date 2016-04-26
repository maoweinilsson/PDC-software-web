Sourcode for Hipmer can be downloaded from
https://sourceforge.net/projects/hipmer/

Hipmer reguires UPC compiler from berkeley

::

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add cmake/3.0.2
  $ module add upcc
  $ export SCRATCH=/pdc/vol/hipmer/0.9.4/build
  $ .generic_deploy/build.sh
  $ cd build/build-generic
  $ make
  $ make install

The executable code will be install under install-generic
