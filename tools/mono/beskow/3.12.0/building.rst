:orphan:

.. include:: building.inc

Fetch the tarball from the mono project webpage:
http://download.mono-project.com/sources/mono/

For example, the downloaded and installed version on Beskow is 3.12.0, so after fetching it we would extract the tarball: 

.. code-block:: bash

   tar -xf mono-3.12.0.tar.bz2


Switched compilers to gnu, although not sure if needed. Do remeber to do a *make check* before the *make install* so that you have checked the installation with the distributed tests. 

.. code-block:: bash

   module swap PrgEnv-cray/5.2.40 PrgEnv-gnu/5.2.40
   ./configure --prefix=/pdc/vol/mono/3.12.0/
   ./autogen.sh --prefix=/pdc/vol/mono/3.12.0/
   make get-monolite-latest
   make EXTERNAL_MCS=${PWD}/mcs/class/lib/monolite/gmcs.exe
   make check
   make install


After that, you should have a bin folder in /pdc/vol/mono/3.12.0/ as well as a etc, include, lib and share.
