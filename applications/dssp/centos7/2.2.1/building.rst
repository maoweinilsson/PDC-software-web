
Project homepage is http://swift.cmbi.ru.nl/gv/dssp

Fetch the code::

  $ ftp://ftp.cmbi.ru.nl/pub/software/dssp/dssp-2.2.1.tgz
  $ module add boost/1.58.0

Patch the makefile with:

.. literalinclude:: files/makefile.patch
       :language: bash

Compile/install::

  $ make install

For Gromacs users: the module sets the DSSP environmental variable to /pdc/vol/dssp/2.2.1/bin/mkdssp, i.e. in your scripts you only need to add "module add dssp" to your scripts.
