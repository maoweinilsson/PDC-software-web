:orphan:


.. include:: using.inc

FFTW on Beskow is supplied by Cray and is integrated into the
CC/cc/ftn script environment so to link programs against fftw it is
only necessary to have the correct fftw module loaded e.g.::

  module load fftw
  cc example.c

The code should compile and link without needing any extra flags.
