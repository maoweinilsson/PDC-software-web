
The software should be cloned with all inbuilt dependencies, and
since gcc compiler 4.8.5 is installed by default, there is no
need to get a later version.

::

  $ git clone --recursive git://github.com/ekg/freebayes.git
  $ module add cmake
  $ make
