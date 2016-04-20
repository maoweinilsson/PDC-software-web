For the current install was used the tarball provided on the website::

  $ wget http://www-almost.ch.cam.ac.uk/site/downloads/almost-2.1.0.tar.gz
  $ tar xvfz almost-2.1.0.tar.gz
  $ cd almost-2.1.0

Before compilation we need to patch the configure script. The script requires to link to liblapack while the optimized Cray the library is named libsci_gnu_49 (in the case of the GNU programming environment). To force linking with the correct one we need to change lines around 5359 from::

  if test "$with_lapack" = "yes"; then
  LDFLAGS="-llapack"
  fi

to::

  if test "$with_lapack" = "yes"; then
  LDFLAGS="-lsci_gnu_49"
  fi


Now we configure::

  $ export CRAYPE_LINK_TYPE=dynamic
  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add cray-libsci
  $ ./configure --prefix=/pdc/vol/almost/2.1.0 --enable-avx --enable-sse4.1 --with-external-blas --with-lapack --with-lapack-lib=/opt/cray/libsci/13.0.1/GNU/49/haswell/lib CC=cc CXX=CC

You should see a message at the end of the configuration such as::

  config.status: executing depfiles commands

  ** You are compiling almost with LAPACK support.
   Following modules are built:
    - RDC residual dipolar couplings

   ** Additional linking: -L/opt/cray/libsci/13.0.1/GNU/49/haswell/lib -lsci_gnu_49 

And compile::

  $ make -j 4 install
