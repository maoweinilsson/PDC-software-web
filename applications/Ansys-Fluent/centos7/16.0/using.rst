

Submitting a Fluent job on Tegner
---------------------------------

Typically, you can read your mesh (generated in ICEM, for example) into Fluent on your local machine and setup all the necessary parameters interactively (directly using the GUI). You can then save this as a case file (*mycase.cas.gz*), transfer it to PDC and then prepare the journal file using a text editor on PDC (vi or emacs for example). A small script must also be written to deal with the parallelization of Fluent on PDC.

Since the case file is compressed, it occupies less disk space on PDC  and several parameters have already been setup in this file (the boundary conditions, basic discretization schemes, fluid and turbulence models, etc.). This strategy greatly simplifies the writing of the journal file and avoids syntax errors.

Fluent Journal File
-------------------

The journal file is the equivalent of the definition file in CFX. It is written in a dialect of Lisp called Scheme and contains all the instructions that are to be executed during the run. A basic form of this file, is as follows:

.. literalinclude:: files/mycase.jou
  :language: bash

Save the journal file as *mycase.jou*. In this simple example, we read in the *maycase.cas.gz* file, which we had previously prepared (includes all the boundary conditions and models). We then initialized the flowfield in order to start

the iterations and we solved for 100 iterations. After 100 iterations had been performed, the data generated was written to the file *mycase.dat.gz*. We are assuming here that 100 iterations will suffice for a converged solution.


A script for running Ansys/Fluent on Tegner called fluent_run.sh is shown below.

.. literalinclude:: files/fluent_run.sh
  :language: bash

Note that this script does not include all the arguments that you can supply to Fluent, but you can/should add/replace whatever you want. As it is, it will work fine for your simulations if you follow the notation properly.  In order to run a fluent parallel job on PDC, Once you have created your journal file, you can submit the job using command on Tegner

.. code-block:: bash
 
 sbatch fluent_run.sh 

In this example, we requested 2 nodes for one hour. We also have chosen to run on full processors per node with the fluent 3d double precision solver. Here the instructions is given to the Fluent solver via the journal file mycase.jou which is assumed to be located in the same directory as the *fluent_run.sh* script.  Note that  you can give the number of processes per node to the script by changing command *#SBATCH --ntasks-per-node=24*.  

Formation on how to submit jobs on Tegner, see `Job Submission on Tegner <https://www.pdc.kth.se/resources/computers/tegner/how-to/run>`_ .

