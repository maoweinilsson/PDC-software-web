Installing ROOT
===============

#. Create a directory for containing the build:: 

	$ mkdir ROOT/5.34.34
	$ cd ROOT/5.34.34

#. The entire ROOT source can be obtained from our public Git repository::

	$ git clone http://root.cern.ch/git/root.git
	$ cd root
	$ git tag -l
	$ git checkout -b v5-34-34 v5-34-34

#. Load appropiate modules::

	$ module load gcc/4.8.4

#. Run::

	$ ./configure --prefix=<install/folder>
	$ ./make
	$ ./make install


Running ROOT
============

Tegner has ROOT installed and a module created::
	
	$ module avail ROOT

Load a specific version for use::
	
	$ module load ROOT/5.34.34


