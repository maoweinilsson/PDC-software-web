:orphan:

.. include:: building.inc

Download from <https://software.ecmwf.int/wiki/display/GRIB/Releases>::

  tar xfz grib_api-1.12.1.tar.gz
  cd grib_api-1.12.1
  export CC=cc
  export CFLAGS="-O2 -g"
  export FC=ftn
  export FCFLAGS="-O2"
  export F77=ftn
  export FFLAGS="-O2"
  ./configure --prefix={installation path} --disable-jpeg --disable-shared --enable-pthread
  make
  make check
  make install
