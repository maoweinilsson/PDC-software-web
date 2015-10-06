

Download and extract the tarball::

  $ wget http://www.qe-forge.org/gf/download/frsrelease/199/855/espresso-5.2.1.tar.gz
  $ tar xvzf espresso-5.2.1.tar.gz

Download tarballs into archive directory::

  $ cd espresso-5.2.1/archive

  $ wget http://qe-forge.org/gf/download/frsrelease/173/652/neb-5.2.1.tar.gz
  $ wget http://qe-forge.org/gf/download/frsrelease/173/648/tddfpt-5.2.1.tar.gz
  $ wget http://qe-forge.org/gf/download/frsrelease/173/649/xspectra-5.2.1.tar.gz
  $ wget http://qe-forge.org/gf/download/frsrelease/173/651/PHonon-5.2.1.tar.gz
  $ wget http://qe-forge.org/gf/download/frsrelease/173/647/atomic-5.2.1.tar.gz
  $ wget http://qe-forge.org/gf/download/frsrelease/173/650/pwcond-5.2.1.tar.gz
  $ wget http://qe-forge.org/gf/download/frsrelease/173/653/GWW-5.2.1.tar.gz

Modules loaded::

  $ module load fftw

Modules at configure time::

  1) modules/3.2.6.7                                                          16) cray-mpich/7.0.4
  2) nodestat/2.2-1.0502.58998.2.7.ari                                        17) slurm/slurm-14.11.9
  3) sdb/1.0-1.0502.58450.3.27.ari                                            18) openssh/5.3p1-with-pam-gsskex-20100124
  4) alps/5.2.3-2.0502.9295.14.14.ari                                         19) openafs/1.6.10-3.0.101-0.35.1_1.0502.8640-cray_ari_s
  5) lustre-cray_ari_s/2.5_3.0.101_0.35.1_1.0502.8640.15.1-1.0502.18911.12.4  20) heimdal/1.5.2
  6) udreg/2.3.2-1.0502.9889.2.20.ari                                         21) snic-env/1.0.0
  7) ugni/6.0-1.0502.10245.9.9.ari                                            22) slurm-utils/0.0
  8) gni-headers/4.0-1.0502.10317.9.2.ari                                     23) pdc-utils/0.0
  9) dmapp/7.0.1-1.0502.10246.8.47.ari                                        24) support-helper/current
 10) xpmem/0.1-2.0502.57015.1.15.ari                                          25) fftw/3.3.4.0
 11) hss-llm/7.2.0                                                            26) intel/14.0.4.211
 12) Base-opts/1.0.2-1.0502.57047.1.1.ari                                     27) cray-libsci/13.0.1
 13) craype-network-aries                                                     28) pmi/5.0.5-1.0000.10300.134.8.ari
 14) craype/2.2.1                                                             29) atp/1.7.5
 15) craype-haswell                                                           30) PrgEnv-intel/5.2.56

Configuring and building has to be done on a compute node
since the code is aware of instruction sets!

This requires a hack in the configure script. Change::

  auxdir=`echo $0 | sed 's/\(.*\)\/.*/\1/'` # extract pathname

to::

  # radovan: changed 0 to 3 because of aprun -n 1
  auxdir=`echo $3 | sed 's/\(.*\)\/.*/\1/'` # extract pathnam

Configuring::

  $ salloc
  $ aprun -n 1 ./configure ARCH=crayxt4 --enable-openmp --enable-parallel --with-scalapack

Build with WEST::

  $ salloc
  $ aprun -n 1 -d 32 make all -j32
  $ aprun -n 1 -d 32 make west -j32

For testing modify file ``environment_variables``::

  #TMP_DIR=$PREFIX/tempdir
  TMP_DIR=/cfs/klemming/nobackup/b/bast/scratch

  #PARA_PREFIX="mpirun -np 2"
  #PARA_PREFIX=" "
  PARA_PREFIX="aprun -n 2"

  #PARA_IMAGE_PREFIX="mpirun -np 4"
  PARA_IMAGE_PREFIX="aprun -n 4"

Then test::

  $ salloc
  $ cd /pdc/vol/espresso/5.1.1/src/espresso-5.2.1/PW/tests
  $ ./check-pw.x.j
  $ cd /pdc/vol/espresso/5.1.1/src/espresso-5.2.1/CPV/tests
  $ ./check-cp.x.j

If everything is OK then copy the contents of bin to the installation_directory/bin.  Make sure you copy the executables and not just the symlinks as they reference relative paths::

  $ cp -L /pdc/vol/espresso/5.2.1+west-1.0.2/src/espresso-5.2.1/bin/* /pdc/vol/espresso/5.2.1+west-1.0.2/bin



