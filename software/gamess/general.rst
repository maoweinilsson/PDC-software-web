

.. _gamess:

======
GAMESS
======


About GAMESS
============

The General Atomic and Molecular Electronic Structure System (GAMESS)
is a general ab initio quantum chemistry package.
GAMESS is maintained by the members of the Gordon research group at Iowa State University.
For more information visit the
`GAMESS website <http://www.msg.ameslab.gov/GAMESS/GAMESS.html>`_.
See also the
`GAMESS information in the SNIC knowledge base <http://docs.snic.se/wiki/GAMESS>`_.


Appropriate citation
--------------------

It is essential that you read the GAMESS manual thoroughly to properly
reference the papers specified in the instructions. All publications using
gamess should cite at least the following paper::

  @Article{GAMESS,
     author={M.W.Schmidt and K.K.Baldridge and J.A.Boatz and S.T.Elbert and
               M.S.Gordon and J.J.Jensen and S.Koseki and N.Matsunaga and
               K.A.Nguyen and S.Su and T.L.Windus and M.Dupuis and J.A.Montgomery},
     journal={J.~Comput.~Chem.},
     volume=14,
     pages={1347},
     year=1993,
     comment={The GAMESS program}}


Performance optimization
========================

It is highly recommended to use::

  $SCF DIRSCF=.TRUE. $END

The default value of DIRSCF=.FALSE. causes integrals to be written to disk for
later use and considerably (negatively) affects the performance of the file
system and of your calculation.
