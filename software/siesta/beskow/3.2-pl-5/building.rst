:orphan:

You can download the software for free if you work within academics/research or at a computer center at:
http://departments.icmab.es/leem/siesta/CodeAccess/selector.html

.. code-block:: bash

   tar -xf siesta-3.2-pl-5.tgz

Some information can be found here, or in the manual:
http://hpcwiki.it.okstate.edu/index.php/Building_Siesta

Switched compilers since PrgEnv-cray couldn't create ftn executables according to siesta builder.
Also note the necessary exports:

.. code-block:: bash

   module swap PrgEnv-cray/5.2.40 PrgEnv-intel/5.2.40 
   cd /pdc/vol/siesta/3.2-pl-5/src/siesta-3.2-pl-5/Obj
   export CC=cc
   export FC=ftn
   export CRAYPE_LINK_TYPE=dynamic
   export CRAY_ROOTFS=DSL


The --prefix flag doesn't seem to work in the ./configure step, so continue with:

.. code-block:: bash

   salloc
   aprun -n 1 -d 32 ../Src/configure  --enable-mpi        
   aprun -n 1 -d 32 make
   cd ../Pseudo/atom
   aprun -n 1 -d 32 make
   cd ../../Util
   aprun -n 1 -d 32 sh build_all.sh

After that, you should have a siesta executable in /Obj

To test the installation you can create a work directory in /nobackup and do the following (assuming the work directory name is h20:

.. code-block:: bash

   export PATH=Path-to-siesta/Obj/:$PATH   
   cd h2o
   cp path-to-siesta/Examples/H2O/h2o.fdf .
   cd path-to-siesta/Pseudo/atom/Tutorial/PS-Generation/O
   sh ../../Utils/pg.sh O.tm2.inp
   cp O.tm2.psf path-to-working-dir/h2o/O.psf
   cp path-to-siesta/Examples/Vps/H.psf path-to-working-dir/h2o/H.psf
   aprun -n 1 -d 32 ./siesta < h2o.fdf | tee h2o.out

This should generate a series of files described shortly below (extracted from the manual):

 * fdf.log (contains all the data used, explicit or chosen by default)
 * O.ion and H.ion (complete information about the basis and KB projectors)
 * h2o.XV (contains positions and velocities)
 * h2o.STRUCT-OUT (contains the nal cell vectors and positions in crystallographic" format)
 * h2o.DM (contains the density matrix to allow a restart)
 * h2o.ANI (contains the coordinates of every MD step, in this case only one)
 * h2o.FA (contains the forces on the atoms)
 * h2o.EIG (contains the eigenvalues of the Kohn-Sham Hamiltonian)
 * h2o.xml (XML marked-up output)
