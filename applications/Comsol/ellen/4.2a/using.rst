:orphan:

.. include:: using.inc

We recommend using Comsol on Ellen in a server fashion. You first log in to the shared memory machine (i.e. Ellen), and then you start the comsol server. After that, you connect with the comsol client from your laptop or desktop computer. Alternatively you may log in to `Povel <http://www.pdc.kth.se/resources/computers/povel>`_ and start the client there; this may be needed if you do not have the correct version of comsol on your laptop.

Start the Comsol server on Ellen
--------------------------------

1. Login to Ellen (ellen.pdc.kth.se)
2. Go to your working directory (cd /cfs/klemming/...)
3. Load the comsol module you want, for instance:

.. code-block:: bash

    module add comsol/4.2a

4. Start the Comsol server:

.. code-block:: bash

    comsol -np 8 server


You will then be asked for an username and password and to log in to the comsol server. Invent one - **do NOT your PDC password!** A port number will be displayed which the server is started at. You (may) need that to connect to the server from your Comsol client.



Connect a client to the Comsol server
-------------------------------------
Next step is to start the client which you connect to the comsol server running on Ellen. Below is an example where you run the client on Ferlin, but you can also run the Comsol client locally on your laptop or desktop, which may be more convenient. If you use windows, you can probably tell COMSOL to connect to a server in the graphical user interface.


1. Login to Povel (povel.pdc.kth.se)
2. Go to an interactive node:

.. code-block:: bash

    module add easy 
    spattach -i -p1

3. When the prompt returns, run:

.. code-block:: bash

    module add comsol/4.2a

4. Go to your working directory (cd ~/Private/[...])
5. Then, start the client:

.. code-block:: bash

    comsol client -server ellen.pdc.kth.se -port PORTNUMBER


*PORTNUMBER* is the port number reported mentioned above which was displayed on Ellen when the server was started. After the initial Comsol window pops up, go to the settings tab, and enter your previously chosen password in the password box. Also check that the username is the same as the one you entered on the server. You should now be able to create new models and open any existing Comsol models. All heavy computations and memory intensive operations should now run on the server (i.e. on Ellen).

For additional information on how to start the server, see:

.. code-block:: bash

 comsol -h

There is an option to set the number of processors to use, for instance -n 9  (see step four of the server procedure on Ellen). Since Ellen is a shared resource, please be considerate. For smaller problems using more than a few (1-4) processors is not going to help you much.
