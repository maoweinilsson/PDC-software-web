
The modules are built using different versions of gcc compiler. You can check available modules using::

  $ module avail netcdf

For example, load one module with gcc v4.9.2 ::

  $ module load gcc/4.9.2
  $ module load netcdf/4.1.1-gcc-4.9

As an example, we can compile and link a code (here ``example.c``) after loading the module like this::

  $ gcc -I/pdc/vol/netcdf/4.1.1/gcc/4.9/include example.c

