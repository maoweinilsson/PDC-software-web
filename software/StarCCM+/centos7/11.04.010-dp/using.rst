

The Star-CCM files can be accessed by loading the appropriate modules. To see which versions of Star-CCM+ are available use the command

.. code-block:: bash

 module avail starccm+

In order to use StarCCM+ at PDC you must provide your own license for the software.  You can either use the environment variable

.. code-block:: bash

 CDLMD_LICENSE_FILE

to set to point to the correct license server (not the PoD server 1999@flex.cd-adapco.com), or get access to STAR-CCM+ through license keys generated "power-on-demand" with additional options in the command line

.. code-block:: bash

 -podkey your_license_key -licpath 1999@flex.cd-adapco.com

where "your_license_key" is the license key.

Running StarCCM+ with GUI on an interactive node
------------------------------------------------

First book an interactive node from tegner login node (e.g. *tegner.pdc.kth.se*) 

.. code-block:: bash
    
   tegner$ salloc -N 1 -t10:00:00  # 10 hours
   salloc: Granted job allocation 2364
   salloc: Waiting for resource configuration
   salloc: Nodes t02n01 are ready for job

After that, from your local computer directly login on the interactive node (*t02n01.pdc.kth.se* in this example) and  then launch the command *starccm+*.

.. code-block:: bash

   local$ ssh -Y username@t02n01.pdc.kth.se
 
   t02n01$ module add starccm+/11.02.009-dp
   t02n01$ starccm+ &

Running on the Batch system
---------------------------

sample job script

.. literalinclude:: files/starccm_run.sh
  :language: bash

Notice that you have to set the number of cores in two places at the top in the

.. code-block:: bash

 #SBATCH -n 48

line and at the bottom when you specify

.. code-block:: bash

 -np 48 

Formation on how to submit jobs on Tegner, see `Job Submission on Tegner <https://www.pdc.kth.se/resources/computers/tegner/how-to/run>`_ .

