instructions for building the software can be found at::

  https://github.com/ndaniel/fusioncatcher/blob/master/doc/manual.md#4---installation-and-usage-examples

In order to download please use::

  wget http://sf.net/projects/fusioncatcher/files/bootstrap.py -O bootstrap.py && python bootstrap.py -t --download --prefix=.

The software needs bowtie 1.2 which needs the tbb library and this dependency is added
in the module file::

  export LD_LIBRARY_PATH=/pdc/vol/i-compilers/17.0.1/tbb/lib/intel64/gcc4.7

