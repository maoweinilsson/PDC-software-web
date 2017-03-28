
Running ParaView client on an interactive node on Tegner
--------------------------------------------------------

You can book a compute node for interactive running ParaView. The command to do this is salloc e.g. ::

 salloc --nodes=1 -t 1:00:00 -A <your_project>

which will book one node for one hour. And then login on the node from local computer to run VisIt using commands ::

 module add paraview/5.0.0-gcc-4.8
 paraview --mpi


Running ParView client-server
-----------------------------

The process has several steps:
 - Start the client on your local computer
 - Start the server on the PDC machines
 - Configure the client to connect to the server


1. Starting the client on your local computer

As this is unlikely to be a PDC machine then you should check the Paraview
documentation for how to do this.


2. Starting the server on the PDC machines


First log into the PDC machine you want to use and reserve the nodes you want
to use. Check the documentation of each machine on the best way to do this.

To start the Paraview server first load the required modules to access paraview.

  $ module add paraview/5.0.0-gcc-4.8

Once you have loaded the module and reserved the nodes you can start the server
in parallel using mpirun. Make sure you start the server in the correct place
(i.e. not on the login nodes, but on the nodes you have reserved)::

  $ mpirun -np <number of processors> pvserver --use-offscreen-rendering

You should then get some text output showing which port paraview is using::

  Listen on port: 11111
  Waiting for client...

11111 is the default port, but you an configure pvserver to use a different one.

3. Connecting the client to the server

You now have to tell your client to connect to the server:
 - Open the choose server window in paraview (file menu then click connect).
 - Click add server.
 - This opens the configure new server box:
    - The name field is just to help you remember which server you are configuring.
    - Server type should be client server.
    - Host is the address of the nodes you are running the server on (e.g. t01n01.pdc.kth.se). The server shold NOT be running on the login nodes.
    - Port is as above (default is 11111).
    - Click configure.
    - Then select manual startup type.
    - Click save.
 - Now select the server we whose details we just entered and click connect.

Your client should now connect to the pvserver we set up and you should be able to do parallel rendering.
