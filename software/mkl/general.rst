

`Intel Math Kernel Library (MKL) <https://software.intel.com/en-us/intel-mkl>`_
is a math library
developed by Intel which provides BLAS, CBLAS, LAPACK, and SCALAPACK.

For linking consult the `math kernel library link line advisor <https://software.intel.com/en-us/articles/intel-mkl-link-line-advisor/>`_.

Also note that when you compile using the Intel compilers, you can avoid
all explicit linking by using the ``-mkl=[parallel,sequential,cluster]`` compiler flag.
