:orphan:

.. include:: building.inc

First load the GNU environment and CMake::

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add cmake

Modules loaded at configure time::

   1) modules/3.2.6.7                                                          15) cray-mpich/7.0.4
   2) nodestat/2.2-1.0502.53712.3.109.ari                                      16) slurm/slurm-14.03.7
   3) sdb/1.0-1.0502.55976.5.27.ari                                            17) openssh/5.3p1-with-pam-gsskex-20100124
   4) alps/5.2.1-2.0502.9041.11.6.ari                                          18) openafs/1.6.10-3.0.101-0.31.1_1.0502.8394-cray_ari_s
   5) lustre-cray_ari_s/2.5_3.0.101_0.31.1_1.0502.8394.10.1-1.0502.17198.8.51  19) heimdal/1.5.2
   6) udreg/2.3.2-1.0502.9275.1.12.ari                                         20) snic-env/1.0.0
   7) ugni/5.0-1.0502.9685.4.24.ari                                            21) craype/2.2.1
   8) gni-headers/3.0-1.0502.9684.5.2.ari                                      22) cmake/3.0.2
   9) dmapp/7.0.1-1.0502.9501.5.219.ari                                        23) gcc/4.9.1
  10) xpmem/0.1-2.0502.55507.3.2.ari                                           24) cray-libsci/13.0.1
  11) hss-llm/7.2.0                                                            25) pmi/5.0.5-1.0000.10300.134.8.ari
  12) Base-opts/1.0.2-1.0502.53325.1.2.ari                                     26) atp/1.7.5
  13) craype-network-aries                                                     27) PrgEnv-gnu/5.2.40
  14) craype-haswell

Then extract the tarball and configure Dalton for CRAY::

  $ ./setup --fc=ftn --cc=cc --cxx=CC --cray --mpi --omp --scalapack --prefix=/pdc/vol/dalton/2013.4/gnu build_gnu

Then build both the dalton.x and lsdalton.x binaries::

  $ cd build_gnu
  $ make

Test using::

  /pdc/vol/dalton/2013.4/test/test-gnu.sbatch

Install with::

  $ make install

Then move everything in::

  /pdc/vol/dalton/2013.4/gnu/dalton

one level up to (rename dalton directory first, otherwise you cannot move dalton script)::

  /pdc/vol/dalton/2013.4/gnu

For more information see: http://dalton-installation.readthedocs.org.

The sources need to be made readable only to sinstall. They should not be readable
to all users.
