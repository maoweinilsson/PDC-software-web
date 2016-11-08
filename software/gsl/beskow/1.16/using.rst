
You can load the module using::

  $ module load gsl/1.16

As an example, we can compile and link a code (here ``example.c``) after loading the module like this::

  $ cc -I/pdc/vol/gsl/1.16/GNU/4.9/bin -o a.out example.c -L/pdc/vol/gsl/1.16/GNU/4.9/lib  -lgsl

