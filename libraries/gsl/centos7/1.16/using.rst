
You can load the module using::

  $ module load gsl/1.16

As an example, we can compile and link a code (here ``example.c``) after loading the module like this::

  $ gcc -I/pdc/vol/gsl/1.16/include -o a.out example.c -L/pdc/vol/gsl/1.16/lib -lgsl

