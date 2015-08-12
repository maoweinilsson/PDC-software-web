

We recommend using Comsol on Tegner in a server fashion. First you should have to book an interactive node from the login node (i.e. tegner) and then you start to launch the comsol server on the interactive node.  After that, you connect with the comsol client from your laptop or desktop computer. 

Start the Comsol server on Tegner
--------------------------------

1. Login to Tegner (tegner.pdc.kth.se)

2. Go to your working directory (cd /cfs/klemming/...)

3. Load the comsol module you want, for instance:

.. code-block:: bash

   tegner$  module add comsol/5.1

4. Book an interactive node, 

.. code-block:: bash
    
   tegner$ salloc -N 1 -t10:00:00  # 10 hours
   salloc: Granted job allocation 2364
   salloc: Waiting for resource configuration
   salloc: Nodes t02n01 are ready for job

4. Start the Comsol server,

.. code-block:: bash

   bash-4.2$ srun comsol -np 16 server
   COMSOL 5.1 (Build: 136) Multiphysics Server started listening on port 2036
   Use the console command 'close' to exit the program

The above should then start the comsol server on node *t02n01.pdc.kth.se* as you can see above. The command *srun* will make sure that everything starts on the interactive node.

In the first time, you will then be asked for an username and password and to log in to the comsol server. Invent one - **do NOT your PDC password!** A port number (*2036* in the case) will be displayed which the server is started at. You (may) need that to connect to the server from your Comsol client.


Connect a client to the Comsol server
-------------------------------------
Next step is to start the client which you connect to the comsol server running on Tegner. You can  run the Comsol client locally on your laptop or desktop, which may be more convenient. If you use windows, you can probably tell COMSOL to connect to a server in the graphical user interface. For the local Linux systems, you can

1. Go to your working directory (cd ~/Private/[...])
2. Then, start the client:

.. code-block:: bash

    comsol client -server SERVERNODE -port PORTNUMBER

*SERVERNODE* is the node you have booked for the job (*t02n01.pdc.kth.se* in the case).
*PORTNUMBER* is the port number reported mentioned above which was displayed on Tegner when the server was started (*2036* in the case). After the initial Comsol window pops up, go to the settings tab, and enter your previously chosen password in the password box. Also check that the username is the same as the one you entered on the server. You should now be able to create new models and open any existing Comsol models. All heavy computations and memory intensive operations should now run on the server node (i.e. on t02n01.pdc.kth.se).

For additional information on how to start the server, see:

.. code-block:: bash

 comsol -h

There is an option to set the number of processors to use, for instance *-np 16*  (see step four of the server procedure on Tegner).
