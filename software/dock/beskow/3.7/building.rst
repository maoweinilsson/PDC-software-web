:orphan:

.. include:: building.inc

1) Requested dock 3.7 from http://dock.compbio.ucsf.edu/DOCK3.7/
2) Obtained license information from http://dock.compbio.ucsf.edu/Online_Licensing/dock_license_application.html
  2.1) Every user should request a license and all publications using dock should acknowledge dock
3) Link obtained via e-mail
4) Downloaded dock 3.7
5) Saved dock.3.7.tar.gz in /pdc/vol/dock/3.7
6) Unpacked dock into same directory
7) created bin directory
8) Switched to intel compiler
9) compiled libfgz
  9.1) cd docking/DOCK/src/libfgz
  9.2) changed Makefile to...
       F77=ftn
       CC=cc  
       uncommented IFORTPATH
  9.3) COMPILER=ifort SIZE=64 make
10) compiled i386
  10.1) cd docking/DOCK/src/i386
  10.2) changed Makefile.ifort to...
       F77=ftn
       CC=cc  
       uncommented PGPATH
  10.3) COMPILER=ifort SIZE=64 make
11) created symlinks in bin directory
12) Added Module file according to instruction
    https://wiki.pdc.kth.se/index.php/Create_module
