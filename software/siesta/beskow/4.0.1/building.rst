

SIESTA is released under the GPL open-source license. The code can be downloaded from:
https://launchpad.net/siesta

Unpack the source code:

.. code-block:: bash

   cd /pdc/vol/siesta/4.0.1/src
   tar -zxf siesta-4.0.1.tar.gz

Documentation can be found here:
https://departments.icmab.es/leem/siesta/Documentation/

SIESTA 4.0.1 is compiled with the Intel compiler environment.
Compiler names and flags are set in the arch.make file.
The compilation should be done on a compute node in an interactive session.

.. code-block:: bash

   module swap PrgEnv-cray PrgEnv-intel 
   cd /pdc/vol/siesta/4.0.1/Obj_siesta
   salloc ...  # request interactive session
   aprun -n 1 sh ../Src/obj_setup.sh
   aprun -n 1 make

After these steps, you should have a siesta executable in /Obj_siesta.

To test the installation you can copy the directory `/pdc/vol/siesta/4.0.1/Tests` to your klemming directory, change "mpirun -np" to "aprun -n" in the `tests.mk` file and adopt the path to the siesta executable, and run all tests
by typing `make`.   
Make sure that all tests pass.

To compile transiesta, create a new Obj directory and compile with `make transiesta`:

.. code-block:: bash

   module swap PrgEnv-cray PrgEnv-intel 
   cd /pdc/vol/siesta/4.0.1/Obj_transiesta
   salloc ...  # request interactive session
   aprun -n 1 sh ../Src/obj_setup.sh
   aprun -n 1 make transiesta


To build all extra utilities that are shipped with SIESTA, go to the Util
directory and compile using the `build_all.sh` script:

.. code-block:: bash

   module swap PrgEnv-cray PrgEnv-intel 
   module load fftw
   cd /pdc/vol/siesta/4.0.1/Util
   salloc ...  # request interactive session
   aprun -n 1 sh build_all.sh

