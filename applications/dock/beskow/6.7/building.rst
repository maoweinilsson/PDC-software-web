

* Requested dock 6.7 from http://dock.compbio.ucsf.edu/DOCK_6/index.htm
* Obtained license information from http://dock.compbio.ucsf.edu/Online_Licensing/dock_license_application.html

    * Every user should request a license and all publications using dock should acknowledge dock

* Link obtained via e-mail
* Downloaded dock 6.7
* Saved dock.6.7.tar.gz in /pdc/vol/dock/6.7
* Unpacked dock into same directory
* Switched to intel compiler

.. code-block:: bash

  module swap PrgEnv-cray PrgEnv-intel

* Switched to install directory

.. code-block:: bash

  cd dock6/install
  cp intel intel.parallel

* Created intel.parallel from intel, to use wrappers and MPI

.. literalinclude:: files/intel.parallel
    :language: bash

* Compiled

.. code-block:: bash

  cat << EOF > compile-script.sh
  #!/bin/bash -l
  ./configure intel parallel && make all
  EOF
  chmod +x compile-script.sh
  salloc
  aprun -n 1 ./compile-script.sh

* The software was tested via

.. code-block:: bash

  cd test
  salloc -t 60 aprun -n 1 make test

* Added Module file according to instruction
  https://wiki.pdc.kth.se/index.php/Create_module
