Intallation followed instructions found on `SLEPc's official page <http://slepc.upv.es/documentation/instal.htm>`_ 

On Beskow we recommend compiling SLEPc with the CRAY compilers::

  $ module load PrgEnv-cray 
  $ module load cray-petsc/3.6.1.0 
  $ module load cray-tpsl/1.5.2

Follow the installation steps::
  #. Download the `appropiate version <http://slepc.upv.es/download/download.htm>`_ depending on the installed PETSC version and save it in  ``/pdc/vol/slepc/<version>/download``
  #. Unbundle the distribution file in ``/pdc/vol/slepc/<version>`` with usual command such as ``tar xzf slepc-3.6.1.tar.gz``. This will create a directory and unpack the software there. Rename this upacked directory to src
  #. Set the environment variable SLEPC_DIR to the full path of the SLEPc home directory, for example, ``export SLEPC_DIR=/pdc/vol/slepc/3.6.3/src``
  #. Set (check if it's set by the module load) ``PETSC_DIR=/opt/cray/petsc/3.6.1.0/real/CRAY/8.3/haswell`` and ``PETSC_ARCH=CRAY``.
  #. Edit line 107 from ``$SLEPC_DIR/config/packages/petsc.py``. Chage it from ``self.destdir = v`` to ``self.destdir = '/opt/cray/petsc/3.6.1.0/real/CRAY/8.3/haswell/``
  #. In the SLEPC_DIR, execute ``./configure``
  #. ``make & make install``
