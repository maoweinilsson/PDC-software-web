
SPAdes can be downloaded from http://spades.bioinf.spbau.ru/release3.11.0/
Following the building instructions from http://spades.bioinf.spbau.ru/release3.11.0/manual.html#sec2
the source files were downloaded and unpacked
::

  $ module add cmake
  $ module swap PrgEnv-cray PrgEnv-GNU
  $ ./spades_compile.sh

A bin directory will be created with all executable which were then symbolically
linked to our system.
