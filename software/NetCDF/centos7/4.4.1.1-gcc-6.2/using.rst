
You can laod the module with gcc v6.2.0 ::

  $ module load gcc/6.2.0
  $ module load netcdf/4.4.1.1-gcc-6.2

As an example, we can compile and link a code (here ``example.c``) after loading the module like this::

  $ gcc -I/pdc/vol/netcdf/4.4.1.1/gcc/6.2/include example.c

