

A script for running Abaqus on Povel called abaqusPovel.sh is shown below.

.. literalinclude:: files/abaqusPovel.sh
  :language: bash

Note that this script does not include all the arguments that you can supply to Abaqus , but you can/should add/modify the script to suit your needs. You can copy this script to your home directory at PDC and save it as abaqusPovel.sh. Make sure its permissions are set to executable:

.. code-block:: bash

  chmod u+x  abaqusPovel.sh

The script takes two arguments. The first says how many of Povel's cores you want to use for your run. The second says what the name of your input file is. So, in order to run Abaqus on one node on Povel all you have to do is type the following:

.. code-block:: bash

  module add easy
  cd <where ever you have created the files>
  esubmit -n 1 -t 15 ./abaqusPovel.sh 4 yourFile.inp

In this example, we ask to user 1 node for 15 minutes using the esubmit command which is included in the easy module. When the queuing system has processed our request and allocated the node the script steps into action. We have chosen to run on 4 CPUs on the node. The Abaqus input file, yourFile.inp, is assumed to be located in the same directory as the abaqusPovel.sh script.

Once the job has finished, you will receive an email with the output. You will also find the output in a subdirectory by the name of the job number you had.
