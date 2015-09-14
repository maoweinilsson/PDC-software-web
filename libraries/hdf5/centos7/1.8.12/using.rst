
The modules are built using different versions of gcc compiler. You can check available modules using::

  $ module show hdf5

For example, load one module with gcc v4.9.2 ::

  $ module load gcc/4.9.2
  $ module load hdf5/1.8.12-gcc-4.8

As an example, we can compile and link a code (here ``example.c``) after loading the module like this::

  $ gcc -I/pdc/vol/hdf5/1.8.12/gcc/4.9/include example.c

