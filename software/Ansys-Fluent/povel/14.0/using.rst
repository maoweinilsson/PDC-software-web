:orphan:

.. include:: using.inc

Submitting a Fluent job on Povel
--------------------------------

Typically, you can read your mesh (generated in ICEM, for example) into Fluent on your local machine and setup all the necessary parameters interactively (directly using the GUI). You can then save this as a case file (*mycase.cas.gz*), transfer it to PDC and then prepare the journal file using a text editor on PDC (vi or emacs for example). A small script must also be written to deal with the parallelization of Fluent on PDC.

Since the case file is compressed, it occupies less disk space on PDC  and several parameters have already been setup in this file (the boundary conditions, basic discretization schemes, fluid and turbulence models, etc.). This strategy greatly simplifies the writing of the journal file and avoids syntax errors.

Fluent Journal File
-------------------

The journal file is the equivalent of the definition file in CFX. It is written in a dialect of Lisp called Scheme and contains all the instructions that are to be executed during the run. A basic form of this file, is as follows:

.. literalinclude:: files/mycase.jou
  :language: bash

Save the journal file as *mycase.jou*. In this simple example, we read in the *maycase.cas.gz* file, which we had previously prepared (includes all the boundary conditions and models). We then initialized the flowfield in order to start

the iterations and we solved for 100 iterations. After 100 iterations had been performed, the data generated was written to the file *mycase.dat.gz*. We are assuming here that 100 iterations will suffice for a converged solution.


A script for running Ansys/Fluent on Povel called fluent_pdc.sh is shown below.

.. literalinclude:: files/fluent_pdc.sh
  :language: bash

Note that this script does not include all the arguments that you can supply to Fluent, but you can/should add/replace whatever you want. As it is, it will work fine for your simulations if you follow the notation properly. You can copy this script to your home directory on PDC and save it as fluent-pdc.sh. Make sure its permissions are set to executable (chmod a+x fluent-pdc.sh). The fluent-pdc.sh script handles all the arguments for fluent and puts them in the correct format. So, in order to run a fluent parallel job on PDC, and once you have created your journal file, all you have to do is type the following:

.. code-block:: bash

 chmod u+x  fluentPovel.sh
 module add easy
 cd <where ever you have created the files>
 esubmit -n 2 -t 15 ./fluent-pdc.sh 8 3ddp ./case.jou

In this example, we requested 2 nodes for 15 minutes using the esubmit command included in the easy module. When the queuing system has processed our request and allocated the node the *fluent-pdc.sh* script steps into action. We have chosen to run on 8 CPUs per node with the fluent 3d double precision solver. Note - we give the number of processes per node to the script, and when the script starts Fluent it will give 8*2=16 as an argument to the t-flag in Fluent. Instructions are given to the Fluent solver via the journal file mycase.jou which is assumed to be located in the same directory as the fluent-pdc.sh script.

Once the job has finished, you will receive an email with the output. You will also find the output in a subdirectory by the name of the job number you had.
