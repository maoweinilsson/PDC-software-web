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

	$ ./configure --all
	$ ./make

#. Since ROOT has a lot of dependencies for other folders within
   the ROOT directory, all folders where copied to the [OS] folder.
   
#. To initialize users have to run::

     source thisroot.sh
     
   To simplify matters the variable ROOT_INIT was created.




