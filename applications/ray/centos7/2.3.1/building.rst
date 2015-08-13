The installation file can be downloaded from `here <https://github.com/sebhtml/Ray-Releases/blob/master/Ray-2.3.1.tar.bz2>`_.::

  $ module load gcc/5.1
  $ module load openmpi
  $ make PREFIX=/afs/<your_preferred_install_directory> MAXKMERLENGTH=64 MPICXX=mpic++
  $ make install
