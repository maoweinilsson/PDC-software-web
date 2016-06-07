
You can load the module using::

  $ module load kyotocabinet/1.2.76

As an example, we can compile and link a code (here ``example.cc``) after loading the module like this::
   
  $ g++ `kcutilmgr conf -i` -o example example.cc `kcutilmgr conf -l`
  $ ./example

or:: 
  $ g++ -o example example.cc -I/pdc/vol/kyotocabinet/1.2.76/include -L/pdc/vol/kyotocabinet/1.2.76/lib -lkyotocabinet
  $ ./example

More examples can be found at http://fallabs.com/kyotocabinet/spex.html

