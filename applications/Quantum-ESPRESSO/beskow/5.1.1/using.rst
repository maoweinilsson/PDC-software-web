

To see all available versions use::

  $ module avail espresso

You should **always** use the option ``disk_io=low``. With this
option the wave functions are only written at the end of the job rather than
after every intermediate step. This will substantially reduce the load on the
disk systems and make your job run faster.

Also it is **not allowed** to run the the phonon part of Quantum ESPRESSO (i.e.
``ph.x``) on Beskow. This is because the phonon part does not seem to have the
equivalent of ``disk_io=low`` and therefore creates more IO than the shared Lustre
system can handle.

Here is an example input (scf.inp):

.. literalinclude:: files/scf.inp

together with an example run script (qe.run):

.. literalinclude:: files/qe.run
    :language: bash

Here we run on 2 nodes (64 processors in total).
This run requires the ``H_HSCV_PBE-1.0.UPF`` pseudopotential.

Now we are ready to submit the calculation::

  $ sbatch qe.run
