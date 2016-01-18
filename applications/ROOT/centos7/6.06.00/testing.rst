Testing ROOT tests
==================

`The Official Documentation <https://d35c7d8c.web.cern.ch/how/running-root-tests>`_ describes the following tests categories defined within the CTest framework:

#. ROOT basic tests delivered in $ROOTSYS/test
#. ROOT tutorials delivered in $ROOTSYS/tutorials
#. ROOTTEST tests that can be downloaded from `roottest repository <https://root.cern.ch/gitweb?p=roottest.git>`_  by issuing ``git clone http://root.cern.ch/git/roottest.git``

Running tests using an existing installation produced by classic configure/make
-------------------------------------------------------------------------------

Since the ROOTConfig.cmake file is not created when building with ``configure / make``. Also the cmake modules do not get installed. In this case we need to tell cmake where to find these.
Running the ROOTTEST tests::

$ mkdir <test_here_dir>
$ cd <test_here_dir>
$ cmake ../roottest -DCMAKE_MODULE_PATH=${ROOTSYS}/etc/cmake\;<root-sources-dir>/cmake/modules
$ ctest -j8$ ctest -j8

.. On Tegner the cmake fails with 
..
.. literalinclude:: cmake_roottest.log
    	:language: bash
	:emphasize-lines: 1,5,8-11

Running tests from the build directory (CMake)
----------------------------------------------

Testing is not enabled by default when configuring the ROOT build. Enabling is done by the option testing and the option roottest to add the ROOTTEST tests to the test suit. The basic instructions are:::

$ mkdir <builddir>
$ cd <builddir>
$ cmake -Dtesting=ON -Droottest=ON <root-sources-dir>
$ cmake --build
$ ctest -j24

You can select a subset of tests by using the `-R <regexpr>` and see the test output by adding `-V` to the `ctest` command. See the complete set of options of ctest (link is external)
Running tests using an existing installation produced by CMake

Results running roottest on Tegner
----------------------------------
The testroot run on 1/8/24 cores on Tegner with the following results

1. Running on **24 cores, 58% tests passed, 454 tests failed out of 1070**. Please refer to the :download:`log file <files/roottest_tegner_j24.log>` for further details. Label Time Summary

* cling         =  92.61 sec
* regression    =  92.61 sec
* roottest      =  92.61 sec
* tutorial      = 903.86 sec
* **Total Test time** (real) = **473.59 sec**

2. Running on **8 cores, 58% tests passed, 454 tests failed out of 1070**. Please refer to the :download:`log file <files/roottest_tegner_j8.log>` for further details. Label Time Summary

* cling         = 586.35 sec
* regression    = 586.35 sec
* roottest      = 586.35 sec
* tutorial      = 1661.01 sec
* **Total Test time** (real) = **623.45 sec**

3. Running on **single core, 58% tests passed, 454 tests failed out of 1070**. Please refer to the :download:`log file <files/roottest_tegner_j1.log>` for further details. Label Time Summary

* cling         =  53.77 sec
* regression    =  53.77 sec
* roottest      =  53.77 sec
* tutorial      = 684.57 sec
* **Total Test time** (real) = **2448.57 sec**
