Extract files and set AMBERHOME
-------------------------------

::

  tar jxvf AmberTools14.tar.bz2
  tar jxvf Amber14.tar.bz2
  cd amber14
  export AMBERHOME=`pwd`


Modules
-------

::

  module load cuda/7.0
  module load i-compilers/15.0.2
  module load mkl/15.0.2
  module load intelmpi/5.0.3
  export MKL_HOME=/pdc/vol/i-compilers/15.0.2/mkl


Serial build
------------

::

  ./configure -mpi -cuda -intelmpi -noX11 -nomtkpp intel

Building the code::

  make install


Patches
-------

The configure script downloads and suggests applying patches.
We have applied the following patches::

  Available AmberTools 14 patches:

  update.1, update.2, update.3, update.4, update.5, update.6, update.7

  Available Amber 14 patches:

  update.1, update.2, update.3


MPI build
---------

::

  ./configure -mpi -cuda -noX11 -nomtkpp gnu

Building the code::

  make install


Testing the code
----------------

::

  cd /cfs/zorn/nobackup/b/bast/software/amber/14/test
  qsub test.zorn

The runscript ``test.zorn`` is:

.. literalinclude:: files/test.zorn
    :language: bash
