Installing ROOT
===============

#. Load the necessary dependencies:: 

  $ module load gcc/4.8.4
  $ module load ROOT/5.34.34
  $ source $ROOT_INIT
  
#. Download the source code from http://geant4.web.cern.ch/geant4/support/source_archive.shtml
  
#. use cmake to configure, and then make to compile::

	$ cmake-DCMAKE_INSTALL_PREFIX=/afs/pdc.kth.se/pdc/vol/geant4/9.5p01/amd64_co7 /afs/pdc.kth.se/pdc/vol/geant4/9.5p01/src -DGEANT4_INSTALL_DATA=ON
  $ make
  $ make install

#. To initialize users have to run::

     source geant4make.sh
     
   To simplify matters the variable GEANT4_INIT was created.




