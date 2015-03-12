

1)::

  module sw PrgEnv-cray PrgEnv-gnu
  module add gsl/1.16 scons/2.3.4

 did not compile with python (needed swig-1.34)::
  module add anaconda/py27/2.1
  export CRAYPE_LINK_TYPE=dynamic

2) In "freesteam-config" modify::

  # If we're not in Windows, use the original values passed to us from SCons:
       LIB="/pdc/vol/freesteam/2.0/GNU/4.9/lib"
       BIN="/pdc/vol/freesteam/2.0/GNU/4.9/bin"
       INCLUDE="/pdc/vol/freesteam/2.0/GNU/4.9/include"

 In "Sconstruct" modify::
 
        default_emso_location = None
        default_prefix = '/pdc/vol/freesteam/2.0/GNU/4.9'
        python_exe = "/usr/bin/env python"

3)::
  scons -c
  scons
  scons install
