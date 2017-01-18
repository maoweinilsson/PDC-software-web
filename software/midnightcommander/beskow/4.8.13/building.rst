
Source code for installation can be found at
https://midnight-commander.org/

To compile use::

	module swap PrgEnv-cray PrgEnv-gnu
	./configure --with-screen=ncurses --prefix=/pdc/vol/midnightcommander/4.8.13

	make -j 4
	make install
