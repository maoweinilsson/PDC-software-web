

According to the online manual the software should be
compiled with GNU CC. 

First download the source and extract it::

  $ wget http://megasun.bch.umontreal.ca/People/lartillot/www/pb_mpi1.5a.tar.gz
  $ tar xzvf pb_mpi1.5a.tar.gz

Apparently the package comes with pre-compiled executable, which needs to be removed.
Load modules and build::

  $ make clean
  $ module load gcc/5.1 openmpi/1.8-gcc-5.1
  $ make

binaries are created in the data directory and copied to the amd64_co7/bin directory

