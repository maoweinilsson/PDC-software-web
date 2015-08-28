Download the `source <http://math.nist.gov/oommf/software-12.html>`_.

load the tcl module and export these variables:

.. code-block:: bash
	
	module load tcl/8.6.4-gcc-4.8.2

	export OOMMF_TCL_INCLUDE_DIR=/afs/.pdc.kth.se/pdc/vol/tcl/8.6.4/amd64_co7/gcc/4.8.2/include
	export OOMMF_TK_INCLUDE_DIR=/afs/.pdc.kth.se/pdc/vol/tcl/8.6.4/amd64_co7/gcc/4.8.2/include
	export OOMMF_TCL_CONFIG=/afs/.pdc.kth.se/pdc/vol/tcl/8.6.4/amd64_co7/gcc/4.8.2/lib/tclConfig.sh
	export OOMMF_TK_CONFIG=/afs/.pdc.kth.se/pdc/vol/tcl/8.6.4/amd64_co7/gcc/4.8.2/lib/tkConfig.sh

Then extract and move into the source directory:

.. code-block:: bash
	
	tar zxvf oommf12a5bis_20120928.tar.gz
	cd oomf-1.2a5bis


The module file will have to load tcl:

.. code-block:: bash
	
	#%Module1.0
	#
	# oommf
	#
	set version [file tail [module-info name]]
	set name [file dirname [module-info name]]

	set home /pdc/vol/$name/$version

	if [module-info mode display] {
	        puts stderr "\t$name-$version\n\t OOMMF 1.2 alpha 5 bis (7-Apr-2014) \n\t Compiled with tcl/tk 8.6.4 and numa disabled\n"
	}

	module load tcl
	setenv  OOMMF   $home/build/oommf.tcl

	module-whatis   "oommf"
