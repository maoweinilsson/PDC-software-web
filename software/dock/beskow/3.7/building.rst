:orphan:

.. include:: building.inc

* Requested dock 3.7 from http://dock.compbio.ucsf.edu/DOCK3.7/
* Obtained license information from http://dock.compbio.ucsf.edu/Online_Licensing/dock_license_application.html

    * Every user should request a license and all publications using dock should acknowledge dock

* Link obtained via e-mail
* Downloaded dock 3.7
* Saved dock.3.7.tar.gz in /pdc/vol/dock/3.7
* Unpacked dock into same directory
* created bin directory
* Switched to intel compiler
* compiled libfgz

    * cd docking/DOCK/src/libfgz
    * changed Makefile to...
      F77=ftn
      CC=cc  
      uncommented IFORTPATH
    * COMPILER=ifort SIZE=64 make

* compiled i386

    * cd docking/DOCK/src/i386
    * changed Makefile.ifort to...
      F77=ftn
      CC=cc  
      uncommented PGPATH
    * COMPILER=ifort SIZE=64 make

* created symlinks in bin directory
* Added Module file according to instruction
  https://wiki.pdc.kth.se/index.php/Create_module
