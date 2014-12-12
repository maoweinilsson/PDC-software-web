:orphan:

.. include:: building.inc

You can download the software for free if you work within academics/research or at a computer center at:
http://departments.icmab.es/leem/siesta/CodeAccess/selector.html

.. code-block:: bash

   tar -xf siesta-3.2-pl-5.tgz

Some information can be found here, or in the manual:
http://hpcwiki.it.okstate.edu/index.php/Building_Siesta

Switched compilers since PrgEnv-cray couldn't create ftn executables according to siesta builder:

.. code-block:: bash

   module swap PrgEnv-cray PrgEnv-gnu
   /pdc/vol/siesta/3.2-pl-5/src/siesta-3.2-pl-5/Obj
   ../Src/configure --with-siesta-blas --with-siesta-lapack --enable-mpi        
   make   


Add/make sure this is in arch.make:

.. code-block:: bash

   FPPFLAGS= -DMPI -DFC_HAVE_FLUSH -DFC_HAVE_ABORT -DGRID_DP

Then continue with:

.. code-block:: bash

   cd ../Pseudo/atom
   make
   cd ../../Util
   sh build_all.sh

After that, you should have a siesta executable in /Obj

Running test 32_h2o in the Test directory gives the correct result, except I ran it with 

.. code-block:: bash

   aprun -n 20 -t 300 ../../Obj/siesta < 32_h2o.fdf | tee TEST.out

and moved the generated files from the work directory to the working directory when file errors occured.
