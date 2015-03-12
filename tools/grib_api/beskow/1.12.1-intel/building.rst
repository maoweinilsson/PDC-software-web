

Download from <https://software.ecmwf.int/wiki/display/GRIB/Releases>::

  tar xfz grib_api-1.12.1.tar.gz
  cd grib_api-1.12.1
  module swap PrgEnv-cray/5.2.40 PrgEnv-intel/5.2.40
  export CC=cc
  export CFLAGS="-O2 -g"
  export FC=ifort
  export FCFLAGS="-O2 -g"
  export F77=ifort
  export FFLAGS="-O2 -g"
  ./configure --prefix={installation path} --disable-jpeg --disable-shared --enable-pthread
  make
  make check
  make install
