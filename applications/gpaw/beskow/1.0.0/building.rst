

The instructions for Sisu (Cray XC-30 in Helsinki) can be found at
https://wiki.fysik.dtu.dk/gpaw/platforms/Cray/sisu.html

Requires libxc to be already built, then ::

 module load anaconda/py27/2.5
 module swap PrgEnv-cray PrgEnv-gnu
 export CRAYPE_LINK_TYPE=dynamic
 module load cray-hdf5

update the customise.py as described in the above URL, then ::

 python setup.py build_ext

compiles for a while then gives an error, then ::

 module switch cray-hdf5 cray-hdf5-parallel
 python setup.py install --prefix=path_to_install_prefix
