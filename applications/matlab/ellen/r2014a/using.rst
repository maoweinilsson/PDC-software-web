:orphan:

.. include:: using.inc


Since Ellen is one big shared machine you need to take care not to overuse its resources. Therefore, the resource limits are set lower than the hard limits. If you need to increase your default share of RAM for a certain job you need to do the following (assuming you're using bash):

.. code-block:: bash

  ulimit -m whatYouNeed
  ulimit -v whatYouNeed
  ulimit -d whatYouNeed

The maximum amount of memory can be obtained using

.. code-block:: bash

  ulimit -m 943718400
  ulimit -v 943718400
  ulimit -d 943718400
