:orphan:

.. include:: using.inc

To start the Paraview server first load the required modules to access paraview.

As paraview has several dependancies, there will be multiple modules required::

  $ module add mesa/7.5.2 openmpi/1.4.1-gcc qt/4.7.0 paraview/3.6.1

Once you have loaded the module and reserved the nodes you can start the server
in parallel using mpirun. Make sure you start the server in the correct place
(i.e. not on the login nodes, but on the nodes you have reserved)::

  $ mpirun -np <number of processors> -machinefile <machine file> pvserver --use-offscreen-rendering

You should then get some text output showing which port paraview is using::

  Listen on port: 11111
  Waiting for client...

11111 is the default port, but you an configure pvserver to use a different one.
