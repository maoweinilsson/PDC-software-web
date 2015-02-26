:orphan:

.. include:: using.inc

Example run script:

.. literalinclude:: files/run
    :language: bash

Note that this script edits the input template "input_template" and replaces
``<<++SCRDIR++>>`` by the actual scratch directory::

  ...
  scratch_dir <<++SCRDIR++>>
  ...


Troubleshooting
---------------

A workaround for the error::

  MemRegister in mem_register; err 3

is to set::

  export ONESIDED_USE_UDREG=1
