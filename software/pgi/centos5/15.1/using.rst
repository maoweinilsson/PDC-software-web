

The Portland Group compiler has 3 components

- pgcc - C compiler
- pgcpp - C++ compiler
- pgfortran - fortran compiler

To access the compiler you need to load the correct module::

  module load pgi/15.1

then for example the C the compiler can be invoked using::

  pgcc hello.f

The complete list of available compilers can be seen using::
  
  module avail pgi

