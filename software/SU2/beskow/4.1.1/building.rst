

First load the GNU environment and CGNS::

  $ module swap PrgEnv-cray PrgEnv-gnu
  $ module add cgns/3.2.1-gcc

Then build the SU2 binaries::

  $ mkdir build
  $ cd build
  $ ../configure --prefix=/pdc/vol/su2/4.1.1/GNU CXX=CC --with-MPI=CC --with-CGNS-lib=/pdc/vol/cgns/3.2.1/GNU/lib --with-CGNS-include=/pdc/vol/cgns/3.2.1/GNU/include
  $ make
  $ make install

Based on the input to this configuration, you can add the following environment variables::
  
  $ export SU2_RUN="/pdc/vol/su2/4.1.1/GNU/bin"
  $ export SU2_HOME="/pdc/vol/su2/4.1.1/src"
  $ export PATH=$PATH:$SU2_RUN
  $ export PYTHONPATH=$PYTHONPATH:$SU2_RUN

Test using::
  
  $ cd su2code/TestCases/euler/naca0012
  $ salloc
  $ aprun -n 8 SU2_CFD inv_NACA0012.cfg 


