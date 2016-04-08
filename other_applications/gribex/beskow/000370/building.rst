

Build::

  tar xfz gribex_000370.tar.gz
  cd gribex_000370
  module swap PrgEnv-cray/5.2.40 PrgEnv-intel/5.2.40

  ./build_library

  Do you want to work with GNU gfortran/gcc (answer y), ifort (answer i) ? [n]
	i
  Default is 32 bit reals.
  Do you want 64 bit reals ? [y,n]
	y
  Tables, Local Definitions and libgribexR64.a directory [/usr/local/lib]:
        {installation path}

  ./install

  cd {installation path}

  ln -s libgribexR64.a libgribex.a
