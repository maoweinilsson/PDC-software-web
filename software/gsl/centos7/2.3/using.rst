
You can load the module using::

  $ module load gsl/2.3

As an example, we can compile and link a code (here ``example.c``) after loading the module like this::

  $ gcc -I/pdc/vol/gsl/2.3/include -o a.out example.c -L/pdc/vol/gsl/2.3/lib -lgsl

