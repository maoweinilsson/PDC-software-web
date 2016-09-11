

Create a volume for allinea-forge/6.1, mount it, download the soruce and extract it::

  $ fs mkmount 6.1 V.allinea-forge.6.1 -c pdc.kth.se
  $ mkdir /afs/.pdc.kth.se/pdc/vol/allinea-forge/src/
  $ cd /afs/.pdc.kth.se/pdc/vol/allinea-forge/src/
  $ wget http://content.allinea.com/downloads/allinea-forge-6.1-Redhat-7.0-x86_64.tar
  $ tar xvf allinea-forge-6.1-Redhat-7.0-x86_64.tar
  $ cd allinea-forge-6.1-Redhat-7.0-x86_64

Then run the text installer::

  $ ./textinstall.sh

As install base directory select::

 /afs/pdc.kth.se/pdc/vol/allinea-forge/6.1/amd64_co7	

License needs to be adapted::

  /afs/.pdc.kth.se/pdc/vol/allinea-forge/licences/License


Createa a module file:

.. literalinclude:: files/module
    :language: bash
