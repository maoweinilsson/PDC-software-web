The installation file can be downloaded from `here <https://github.com/voutcn/megahit>`
Megahit was compiled with CUDA support
Unfortunately latest version of cuda was not supported by GNU compiler version 5.1, so
compilation was done with GNU v4.9.2.

::

  $ module load gcc/4.9.2
  $ module load cuda/7.0
  $ make use_gpu=1

The executables of megahit were transferred to the bin directory.
