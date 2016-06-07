
You can load the module using::

  $ module load cfitsio/3.390

As an example, we can compile and link a code (here ``fitscopy.c``) after loading the module like this::

  $ gcc -o fitscopy fitscopy.c `pkg-config  --cflags --libs cfitsio` -lm
  $ fitscopy in.fit out.fit

More examples can be found at http://heasarc.gsfc.nasa.gov/docs/software/fitsio/cexamples.html 

