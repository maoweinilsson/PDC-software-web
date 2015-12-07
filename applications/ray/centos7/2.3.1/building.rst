The installation file can be downloaded from `here <https://github.com/sebhtml/Ray-Releases/blob/master/Ray-2.3.1.tar.bz2>`_.::

  $ module load i-compilers
  $ module load intelmpi
  $ make MAXKMERLENGTH=51 MPICXX=mpiicpc HAVE_LIBZ=y HAVE_LIBZ2=y MPI_IO=y ASSERT=y

The executable Ray was transferred to the bin directory.
According to instructions they use GNU compiler but does also seem to work with intel compiler

