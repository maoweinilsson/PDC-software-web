

.. _raboof:

===============
Dalton/LSDalton
===============


General information
===================

Dalton 2013 consists of two codes (DALTON and LSDALTON)
with separate binaries (dalton.x and lsdalton.x)
and separete run scripts (dalton and lsdalton).
For more information see: http://daltonprogram.org/


Running DALTON 2013.3 on Lindgren
=================================

To run DALTON we need two input files (one dal file for the job specification
and one mol file to specify the molecule structure and basis set). In addition
we need a run script.

To have a simple and quick toy example we will calculate the B3LYP energy of
the H2O2 molecule on 2 nodes. This calculation takes only few seconds to run.

We will use the following job specification (b3lyp_energy.dal)::

  **DALTON
  .RUN WAVE FUNCTION
  .DIRECT
  **WAVE FUNCTION
  .DFT
   B3LYP
  **END OF DALTON

together with the following molecule specification (h2o2.mol)::

  BASIS
  cc-pVDZ
  this is a comment line
  this is a comment line
      2
          8.    2
  O     0.0000  1.4078  0.0000
  O     0.0000 -1.4078  0.0000
          1.    2
  H     0.6908  1.7261  1.6678
  H    -0.6908 -1.7261  1.6678

and the following example runscript (dalton.run)::

  #!/bin/bash

  #PBS -l walltime=0:05:00
  #PBS -l mppwidth=48

  # enable modules within the batch system
  . /opt/modules/default/etc/modules.sh

  module add dalton/2013.3

  # this is where dalton will write temporary files
  export DALTON_TMPDIR=/cfs/klemming/scratch/${USER:0:1}/${USER}/dalton_scratch/$PBS_JOBID

  # it is important that we submit from /cfs/klemming and not from /afs
  # we need to cd to current directory
  cd $PBS_O_WORKDIR

  # run dalton
  export DALTON_LAUNCHER="aprun -n 48"
  dalton -o b3lyp_energy_h2o2.out b3lyp_energy.dal h2o2.mol

Here we run on 2 nodes (48 processors in total).
Do not run serial calculations on Lindgren for anything other than small tests!

Now we are ready to submit the calculation::

  $ qsub dalton.run


Running LSDALTON 2013.3 on Lindgren
===================================

As an example calculation we will repeat the above example now using LSDALTON.

We will use the following job specification (b3lyp_energy.dal)::

  **GENERAL
  **WAVE FUNCTIONS
  .DFT
   B3LYP
  *END OF INPUT

together with the following molecule specification (h2o2.mol)::

  BASIS
  cc-pVDZ
  this is a comment line
  this is a comment line
      2
          8.    2
  O     0.0000  1.4078  0.0000
  O     0.0000 -1.4078  0.0000
          1.    2
  H     0.6908  1.7261  1.6678
  H    -0.6908 -1.7261  1.6678

and the following example runscript (lsdalton.run)::

  #!/bin/bash

  #PBS -l walltime=0:05:00
  #PBS -l mppwidth=48

  # enable modules within the batch system
  . /opt/modules/default/etc/modules.sh

  module add dalton/2013.3

  # this is where dalton will write temporary files
  export DALTON_TMPDIR=/cfs/klemming/scratch/${USER:0:1}/${USER}/dalton_scratch/$PBS_JOBID

  # it is important that we submit from /cfs/klemming and not from /afs
  # we need to cd to current directory
  cd $PBS_O_WORKDIR

  # run lsdalton
  export OMP_NUM_THREADS=1
  export LSDALTON_LAUNCHER="aprun -n 48"
  lsdalton b3lyp_energy.dal h2o2.mol


Compiling Dalton 2013.3 on Lindgren
===================================

First load the Intel environment and CMake::

  $ module swap PrgEnv-pgi PrgEnv-intel
  $ module add cmake

Then extract the tarball and configure Dalton for CRAY::

  $ ./setup --fc=ftn --cc=cc --cxx=CC --cray --mpi --omp --scalapack build_lindgren

Then build both the dalton.x and lsdalton.x binaries::

  $ cd build_lindgren
  $ make

For more information see: http://daltonprogram.org/installation/2013/


Disclaimer
==========

PDC takes no responsibility for the correctness of results produced with the
binaries. We have ran the test set after installation but a number of tests
fail (see below). Hence, always evaluate the binaries against known results for
the systems and properties you are investigating before using the binaries for
production jobs.


Failed DALTON tests on Lindgren (dalton/2013.2)
===============================================

- dft_disp_d2


Failed LSDALTON tests on Lindgren (dalton/2013.2)
=================================================

- LSlib/LSlib_cam_reg
- LSlib/LSlib_cam_dfJ_aK
