

Download and extract the tarball::

  $ wget http://qe-forge.org/gf/download/frsrelease/224/1044/qe-6.0.tar.gz
  $ tar xzf qe-6.0.tar.gz

Modules loaded::

  $ module load fftw
  $ module swap PrgEnv-cray PrgEnv-intel

Modules at configure time::
  1) modules/3.2.6.7
  2) nodestat/2.2-1.0502.58998.2.7.ari
  3) sdb/1.0-1.0502.58450.3.27.ari
  4) alps/5.2.3-2.0502.9295.14.14.ari
  5) lustre-cray_ari_s/2.5_3.0.101_0.35.1_1.0502.8640.15.1-1.0502.18911.12.4
  6) udreg/2.3.2-1.0502.9889.2.20.ari
  7) ugni/6.0-1.0502.10245.9.9.ari
  8) gni-headers/4.0-1.0502.10317.9.2.ari
  9) dmapp/7.0.1-1.0502.10246.8.47.ari
 10) xpmem/0.1-2.0502.57015.1.15.ari
 11) hss-llm/7.2.0
 12) Base-opts/1.0.2-1.0502.57047.1.1.ari
 13) craype-network-aries
 14) craype/2.2.1
 15) craype-haswell
 16) cray-mpich/7.0.4
 17) slurm/slurm-14.11.9
 18) openssh/5.3p1-with-pam-gsskex-20100124
 19) openafs/1.6.17-3.0.101-0.35.1_1.0502.8640-cray_ari_s
 20) heimdal/1.5.2
 21) snic-env/1.0.0
 22) slurm-utils/0.0
 23) pdc-utils/0.0
 24) support-helper/current
 25) fftw/3.3.4.0
 26) intel/14.0.4.211
 27) cray-libsci/13.0.1
 28) pmi/5.0.5-1.0000.10300.134.8.ari
 29) atp/1.7.5
 30) PrgEnv-intel/5.2.56

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

If everything is OK then copy the contents of bin to the installation_directory/bin.  Make sure you copy the executables and not just the symlinks as they reference relative paths::

  $ cp -L  /pdc/vol/espresso/6.0/qe-6.0/bin/* /pdc/vol/espresso/6.0/bin/
