
You can load the module using::

  $ module load glpk/4.60

As an example, we can compile and link a code (here ``example.c``) after loading the module like this::

  $ gcc -I/pdc/vol/glpk/4.60/gcc/4.8.5/include -o a.out example.c -L/pdc/vol/glpk/4.60/gcc/4.8.5/lib -lglpk

