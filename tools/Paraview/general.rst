

Paraview uses a client/server model to do parallel visualisation, and has a
flexible way to connect the client (which normally runs on  your local computer
i.e. the one your keyboard is connected to) to the server (which can run in
parallel on PDC machines).  For more information see: http://www.paraview.org

The process has several steps:
 - Start the client on your local computer
 - Start the server on the PDC machines
 - Configure the client to connect to the server


Starting the client on your local computer
------------------------------------------

As this is unlikely to be a PDC machine then you should check the Paraview
documentation for how to do this.


Starting the server on the PDC machines
---------------------------------------

First log into the PDC machine you want to use and reserve the nodes you want
to use. Check the documentation of each machine on the best way to do this.

To start the Paraview server first load the required modules to access paraview.

As paraview has several dependancies, there will be multiple modules required::

  $ module add i-compilers/15.0.2 intelmpi/5.0.3
  $ module add paraview/4.3.1-intel
    or
  $ module add paraview/4.3.1-intel-mesa # Mesa support

Once you have loaded the module and reserved the nodes you can start the server
in parallel using mpirun. Make sure you start the server in the correct place
(i.e. not on the login nodes, but on the nodes you have reserved)::

  $ mpirun -np <number of processors> -machinefile <machine file> pvserver --use-offscreen-rendering

You should then get some text output showing which port paraview is using::

  Listen on port: 11111
  Waiting for client...

11111 is the default port, but you an configure pvserver to use a different one.

Connecting the client to the server
-----------------------------------

You now have to tell your client to connect to the server:
 - Open the choose server window in paraview (file menu then click connect).
 - Click add server.
 - This opens the configure new server box:
    - The name field is just to help you remember which server you are configuring.
    - Server type should be client server.
    - Host is the address of the nodes you are running the server on (e.g. k33n39.pdc.kth.se). The server shold NOT be running on the login nodes.
    - Port is as above (default is 11111).
    - Click configure.
    - Then select manual startup type.
    - Click save.
 - Now select the server we whose details we just entered and click connect.

Your client should now connect to the pvserver we set up and you should be able to do parallel rendering.
