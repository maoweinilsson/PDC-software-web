

Download and extract the tarball::

  $ wget http://qe-forge.org/gf/download/frsrelease/173/655/espresso-5.1.1.tar.gz
  $ tar xvzf espresso-5.1.1.tar.gz

Download tarballs into archive directory::

  $ cd espresso-5.1.1/archive

  $ wget http://qe-forge.org/gf/download/frsrelease/173/652/neb-5.1.1.tar.gz
  $ wget http://qe-forge.org/gf/download/frsrelease/173/648/tddfpt-5.1.1.tar.gz
  $ wget http://qe-forge.org/gf/download/frsrelease/173/649/xspectra-5.1.1.tar.gz
  $ wget http://qe-forge.org/gf/download/frsrelease/173/651/PHonon-5.1.1.tar.gz
  $ wget http://qe-forge.org/gf/download/frsrelease/173/647/atomic-5.1.1.tar.gz
  $ wget http://qe-forge.org/gf/download/frsrelease/173/650/pwcond-5.1.1.tar.gz
  $ wget http://qe-forge.org/gf/download/frsrelease/173/653/GWW-5.1.1.tar.gz

Modules loaded::

  $ module load fftw

Modules at configure time::

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
  13) craype-network-aries                                                     27) fftw/3.3.4.0
  14) craype/2.2.1

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

Build::

  $ salloc
  $ aprun -n 1 -d 32 make all -j32

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
  $ cd /pdc/vol/espresso/5.1.1/src/espresso-5.1.1/PW/tests
  $ ./check-pw.x.j
  $ cd /pdc/vol/espresso/5.1.1/src/espresso-5.1.1/CPV/tests
  $ ./check-cp.x.j
