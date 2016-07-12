Installing Geant4
=================

#. Load the necessary dependencies:: 

     $ module load gcc/4.8.4
     $ module load ROOT/5.34.34
     $ source $ROOT_INIT
  
#. Download the source code from https://geant4.web.cern.ch/geant4/support/download.shtml
  
#. use cmake (use cmake version 3.3 or higher, by loading the cmake module) to configure, and then make to compile::

     $ cd /afs/.pdc.kth.se/pdc/vol/geant4/10.2/src/build
     $ cmake ../geant4.10.02.p02 -DCMAKE_INSTALL_PREFIX=/afs/.pdc.kth.se/pdc/vol/geant4/10.2/amd64_co7 -DGEANT4_INSTALL_DATA=ON
     $ make
     $ make install

#. To initialize users have to run::

     $ source geant4make.sh
     
   To simplify matters the variable GEANT4_INIT was created.




