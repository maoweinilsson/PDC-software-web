#. The entire ROOT source can be obtained from our public Git repository::

	$ git clone http://root.cern.ch/git/root.git

#. Create a directory for containing the build:: 

	$ mkdir <builddir>
	$ cd <builddir> 

#. Load appropiate modules::

	$ module load fftw/3.3.4-gcc-8.4-openmpi-1.8-double
	$ module load gcc/4.8.4
	$ module load openmpi/1.8-gcc-4.8

#. Run::

	$ configure
	$ make
	$ make install
