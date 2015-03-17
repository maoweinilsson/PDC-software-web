

* Requested dock 3.7 from http://dock.compbio.ucsf.edu/DOCK3.7/
* Obtained license information from http://dock.compbio.ucsf.edu/Online_Licensing/dock_license_application.html

    * Every user should request a license and all publications using dock should acknowledge dock

* Link obtained via e-mail
* Downloaded dock 6.7
* Saved dock.6.7.tar.gz in /pdc/vol/dock/6.7
* Unpacked dock into same directory
* Switched to intel compiler::

  $ module swap PrgEnv-cray PrgEnv-intel
  
* Switched to install directory::

  $ cd dock6/install
  
* Changed intel file::

  CC = cc
  CXX = CC
  ...
  FC = ftn
  ...
  LOAD = CC
  
* Compiled::

  $ make dock
  
* The software was tested via::

  $ cd test
  $ salloc -t 60 aprun -n 1 make test
  
* Added Module file according to instruction
  https://wiki.pdc.kth.se/index.php/Create_module
