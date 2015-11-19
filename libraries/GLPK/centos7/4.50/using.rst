
You can load the module using::

  $ module load glpk/4.50

As an example, we can compile and link a code (here ``example.c``) after loading the module like this::

  $ gcc -I/pdc/vol/glpk/4.50/gcc/4.8.3/include -o a.out example.c -L/pdc/vol/glpk/4.50/gcc/4.8.3/lib -lglpk

