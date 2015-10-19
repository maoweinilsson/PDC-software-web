

In order to build IDBA-UD follow this procedings

#. Download software from http://i.cs.hku.hk/~alse/hkubrg/projects/idba_ud/
#. Unpack
#. The source code of IDB-UD was changed to permit for longer read levels.
   In the file *src/sequence/short_sequence.h*::
   
     static const uint32_t kMaxShortSequence = 300; // Default is 128

#. ::

     $ ./configure
     $ make
