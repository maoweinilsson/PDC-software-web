:orphan:

.. include:: building.inc

Download and extract::

  $ wget http://content.allinea.com/downloads/allinea-reports-latest-Suse-11-x86_64.tar
  $ tar xvf allinea-reports-5.0-40932-Suse-11-x86_64.tar
  $ cd allinea-reports-5.0-40932-Suse-11-x86_64

Then run the text installer::

  $ ./textinstall.sh

As install base directory select::

  /pdc/vol/allinea-reports/5.0-40810

License needs to be adapted::

  /pdc/vol/allinea-reports/5.0-40810/licences/Licence

Then create /pdc/vol/allinea-reports/5.0-40810/system.config.template.
Normally APR tries to create a config directory under $HOME. On Beskow the
compute nodes cannot access it. Therefore we use the template file to create a
config file somewhere under $SNIC_TMP.

Then we create the profiler libraries::

  $ module swap PrgEnv-cray PrgEnv-intel
  $ mkdir -p /pdc/vol/allinea-reports/5.0-40810/prof-libs/INTEL
  $ cd /pdc/vol/allinea-reports/5.0-40810/prof-libs/INTEL
  $ /pdc/vol/allinea-reports/5.0-40810/bin/make-profiler-libraries --platform=cray

  $ module swap PrgEnv-intel PrgEnv-gnu
  $ mkdir -p /pdc/vol/allinea-reports/5.0-40810/prof-libs/GNU
  $ cd /pdc/vol/allinea-reports/5.0-40810/prof-libs/GNU
  $ /pdc/vol/allinea-reports/5.0-40810/bin/make-profiler-libraries --platform=cray

  $ module swap PrgEnv-gnu PrgEnv-cray
  $ mkdir -p /pdc/vol/allinea-reports/5.0-40810/prof-libs/CRAY
  $ cd /pdc/vol/allinea-reports/5.0-40810/prof-libs/CRAY
  $ /pdc/vol/allinea-reports/5.0-40810/bin/make-profiler-libraries --platform=cray

Also created the following helper script and placed it in
/pdc/vol/allinea-reports/5.0-40810/bin/copy-allinea-reports-config:

.. literalinclude:: files/copy-allinea-reports-config
    :language: bash

The tricky part is the module file:

.. literalinclude:: files/module
    :language: bash

Which makes use of pkg-config files like this one (placed in /pdc/vol/allinea-reports/5.0-40810/prof-libs/INTEL):

.. literalinclude:: files/allinea-reports.pc
    :language: bash
