I followed `these <http://deparkes.co.uk/2013/06/24/install-oommf-1-2a5-without-root/>`_ instructions

It shows how to compile a thread enabled tcl/tk in order to build a parallel version of OOMF

Download the source from `here <http://www.tcl.tk/software/tcltk/download.html>`_.


(Before you make tk, make sure you have x11 forwarding i.e. ssh -Y)

Extract the  archives and enter the unix subfolder of tcl
.. code-block:: bash

	tar zxvf tcl8.6.4-src.tar.gz
	tar zxvf tk8.6.4-src.tar.gz
	cd tcl8.6.4/unix
	./configure --prefix=/afs/.pdc.kth.se/pdc/vol/tcl/8.6.4/amd64_co7/gcc/4.8.2 --enable-threads
	make
	make test
	make install
	cd ../../tk8.6.4/unix
	./configure --with-tcl=/afs/.pdc.kth.se/pdc/vol/tcl/8.6.4/amd64_co7/gcc/4.8.2/lib/ --prefix=/afs/.pdc.kth.se/pdc/vol/tcl/8.6.4/amd64_co7/gcc/4.8.2
	make
	make test
	make install

During make test you will most likely get a bunch of failed tests but even more passed ones.  

The --enable-thread flag is important in order to compile a parallel version of OOMMF for which this is a required software for.



Next we need to create the module file.  Make sure to prepend the LD_LIBRARY_PATH.  The current one would be

.. code-block:: bash
	
	#%Module1.0
	#
	# Tcl/tk
	#
	set name tcl
	set version 8.6.4
	set comp gcc
	set comp_v 4.8.2

	set home /pdc/vol/$name/$version/$comp/$comp_v

	prepend-path    PATH            $home/bin
	prepend-path    LD_LIBRARY_PATH $home/lib

There is a system installation of tcl. To make sure that the correct tclsh will be used I created a symlink /afs/.pdc.kth.se/pdc/vol/tcl/8.6.4/amd64_co7/gcc/4.8.2/bin/tclsh -> /afs/.pdc.kth.se/pdc/vol/tcl/8.6.4/amd64_co7/gcc/4.8.2/bin/tclsh8.6

so that it gets chosen in stead of the /usr/bin/tclsh

