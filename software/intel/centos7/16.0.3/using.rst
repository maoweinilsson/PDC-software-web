

The intel compiler has 3 components

- icc - intel C compiler
- icpc - intel C++ compiler
- ifort - intel fortran compiler

To access the compiler you need to load the correct module::

  module load i-compilers/16.0.3

then for example the C the compiler can be invoked using::

  icc hello.c

The complete list of available compilers can be seen using::
  
  module avail i-compilers

