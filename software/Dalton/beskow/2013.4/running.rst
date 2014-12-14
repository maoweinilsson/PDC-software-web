:orphan:

.. include:: running.inc


Dalton
------

To run Dalton we need two input files (one dal file for the job specification
and one mol file to specify the molecule structure and basis set). In addition
we need a run script.

To have a simple and quick toy example we will calculate the B3LYP energy of
the H2O2 molecule on 2 nodes. This calculation takes only few seconds to run.

We will use the following job specification (b3lyp_energy.dal):

.. literalinclude:: files/dalton/b3lyp_energy.dal

together with the following molecule specification (h2o2.mol):

.. literalinclude:: files/dalton/h2o2.mol

and the following example runscript (dalton.run):

.. literalinclude:: files/dalton/dalton.run
    :language: bash

Here we run on 2 nodes (64 processors in total).
Do not run serial calculations on Lindgren for anything other than small tests!

Now we are ready to submit the calculation::

  $ sbatch dalton.run


LSDalton
--------

As an example calculation we will repeat the above example now using LSDalton.

We will use the following job specification (b3lyp_energy.dal):

.. literalinclude:: files/lsdalton/b3lyp_energy.dal

together with the following molecule specification (h2o2.mol):

.. literalinclude:: files/lsdalton/h2o2.mol

and the following example runscript (lsdalton.run):

.. literalinclude:: files/lsdalton/lsdalton.run
    :language: bash
