

The flags for a typical situation, using the intel compiler and 32 bit integers are as follows::

  LDFLAGS="-L/pdc/vol/i-compilers/15.0.2/icc/mkl/lib/em64t -lmkl_intel_lp64 \
           -lmkl_sequential -lmkl_core -lpthread \
           -Wl,--rpath,/pdc/vol/i-compilers/15.0.2/icc/mkl/lib/em64t"
  CFLAGS="-I/pdc/vol/i-compilers/15.0.2/icc/mkl/include"

Also note that when you compile using the Intel compilers, you can avoid
all explicit linking by using the ``-mkl=[parallel,sequential,cluster]`` compiler flag::

  CFLAGS="-mkl=parallel"

more information on the flags can be found at 
	 
http://software.intel.com/en-us/articles/intel-mkl-link-line-advisor
