

First load the Intel environment and CMake::

  $ module swap PrgEnv-cray PrgEnv-intel
  $ module add cmake

Modules loaded at configure time::

   1) modules/3.2.6.7                                                          15) craype-haswell
   2) nodestat/2.2-1.0502.53712.3.109.ari                                      16) cray-mpich/7.0.4
   3) sdb/1.0-1.0502.55976.5.27.ari                                            17) slurm/slurm-14.03.7
   4) alps/5.2.1-2.0502.9041.11.6.ari                                          18) openssh/5.3p1-with-pam-gsskex-20100124
   5) lustre-cray_ari_s/2.5_3.0.101_0.31.1_1.0502.8394.10.1-1.0502.17198.8.51  19) openafs/1.6.10-3.0.101-0.31.1_1.0502.8394-cray_ari_s
   6) udreg/2.3.2-1.0502.9275.1.12.ari                                         20) heimdal/1.5.2
   7) ugni/5.0-1.0502.9685.4.24.ari                                            21) snic-env/1.0.0
   8) gni-headers/3.0-1.0502.9684.5.2.ari                                      22) intel/14.0.4.211
   9) dmapp/7.0.1-1.0502.9501.5.219.ari                                        23) cray-libsci/13.0.1
  10) xpmem/0.1-2.0502.55507.3.2.ari                                           24) pmi/5.0.5-1.0000.10300.134.8.ari
  11) hss-llm/7.2.0                                                            25) atp/1.7.5
  12) Base-opts/1.0.2-1.0502.53325.1.2.ari                                     26) PrgEnv-intel/5.2.40
  13) craype-network-aries                                                     27) cmake/3.0.2
  14) craype/2.2.1

Then extract the tarball and configure DIRAC for CRAY::

  $ ./setup --fc=ftn --cc=cc --cxx=CC --cray --mpi

Then build the dirac.x binary::

  $ cd build
  $ make

Test using::

  /pdc/vol/dirac/14.0/test/test.sbatch

Copy following files and directories to /pdc/vol/dirac/14.0/bin::

  drwx------ 2 bast users     4096 Dec 14 14:24 basis
  drwx------ 2 bast users    12288 Dec 14 14:24 basis_dalton
  drwx------ 2 bast users    12288 Dec 14 14:24 basis_ecp
  -rwx------ 1 bast users  2957028 Dec 14 14:24 cfread.x
  -rwx------ 1 bast users  1141622 Dec 14 14:24 diag.x
  -rwx------ 1 bast users   719259 Dec 14 14:24 dirac_mointegral_export.x
  -rwx------ 1 bast users 68343970 Dec 14 14:24 dirac.x
  -rw------- 1 bast users       40 Dec 14 14:24 GIT_HASH
  -rwx------ 1 bast users   641487 Dec 14 14:24 labread.x
  -rwx------ 1 bast users  3066359 Dec 14 14:24 mx2fit.x
  -rwx------ 1 bast users    83701 Dec 14 14:24 pam
  -rwx------ 1 bast users  2988673 Dec 14 14:24 polfit.x
  -rwx------ 1 bast users   664772 Dec 14 14:24 rspread.x
  -rwx------ 1 bast users  1521912 Dec 14 14:24 test_allocator.x
  -rwx------ 1 bast users   702730 Dec 14 14:24 test_xhost_flag.x
  -rwx------ 1 bast users  3001306 Dec 14 14:24 twofit.x
  -rwx------ 1 bast users  3100917 Dec 14 14:24 vibcal.x

For more information see: http://diracprogram.org/doc/release-14/installation/general.html.

The sources need to be made readable only to sinstall. They should not be readable
to all users.


Failed tests
------------

::

  28 - geo_opt_saddle (Failed)
  94 - xcfun (Failed)
