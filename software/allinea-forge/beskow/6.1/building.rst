

Download and extract::

  $ wget http://content.allinea.com/downloads/http://content.allinea.com/downloads/allinea-forge-latest-Suse-11-x86_64.tar
  $ tar xvf http://content.allinea.com/downloads/allinea-forge-latest-Suse-11-x86_64.tar
  $ cd allinea-forge-latest-Suse-11-x86_64

Then run the text installer::

  $ ./textinstall.sh

As install base directory select::

  /pdc/vol/allinea-forge/6.1

License needs to be adapted::

  /pdc/vol/allinea-forge/License/License

Then create /pdc/vol/allinea-forge/6.1/system.config.template.
Normally Allinea Forge tries to create a config directory under $HOME. On Beskow the compute nodes cannot access it. Therefore we use the template file to create a config file somewhere under $SNIC_TMP.

Then we create the profiler libraries::

  $ module swap PrgEnv-cray PrgEnv-intel
  $ mkdir -p /pdc/vol/allinea-forge/6.1/lib/INTEL
  $ cd /pdc/vol/allinea-forge/6.1/lib/INTEL
  $ /pdc/vol/allinea-forge/6.1/bin/make-profiler-libraries --platform=cray --without-shmem

  $ module swap PrgEnv-intel PrgEnv-gnu
  $ mkdir -p /pdc/vol/allinea-forge/6.1/lib/GNU
  $ cd /pdc/vol/allinea-forge/6.1/lib/GNU
  $ /pdc/vol/allinea-forge/6.1/bin/make-profiler-libraries --platform=cray --without-shmem

  $ module swap PrgEnv-gnu PrgEnv-cray
  $ mkdir -p /pdc/vol/allinea-forge/6.1/lib/CRAY
  $ cd /pdc/vol/allinea-forge/6.1/lib/CRAY
  $ /pdc/vol/allinea-forge/6.1/bin/make-profiler-libraries --platform=cray --without-shmem

Also created the following helper script and placed it in /pdc/vol/allinea-forge/6.1/bin/copy-allinea-forge-config:

.. literalinclude:: files/copy-allinea-forge-config
    :language: bash

The tricky part is the module file:

.. literalinclude:: files/module
    :language: bash

Which makes use of pkg-config files like this one (placed in /pdc/vol/allinea-forge/6.1/lib/INTEL):

.. literalinclude:: files/allinea-forge.pc
    :language: bash
