

Compiling your program using OpenMPI
------------------------------------

Notice that this version is built to use java interface in OpenMPI.
To compile a program using OpenMPI you should load the openmpi module you want to use e.g.::

  module add openmpi/1.10-gcc-java

You can then use the following commands to compile C, C++, Fortran and Java programs respectively::

  mpicc
  mpiCC
  mpif90
  mpijavac

As an example, you can compile a java code (*Hello.java*) and run on Tegner likes

.. code:: bash

   $ module add gcc/5.1 
   $ module add jdk/1.8.0_45
   $ module add openmpi/1.10-gcc-java
   $ mpijavac Hello.java
   $ mpirun -n 4 java Hello

