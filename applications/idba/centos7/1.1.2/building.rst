

In order to build IDBA follow this procedings

#. Download software from https://github.com/loneknightpy/idba/releases
#. Unpack
#. The source code of IDB was changed to permit for longer read levels.
   In the file *src/sequence/short_sequence.h*::
   
     static const uint32_t kMaxShortSequence = 512; // Default is 128

#. ::

     $ ./configure
     $ make
     
#. Create bin and lib directory and install all there
