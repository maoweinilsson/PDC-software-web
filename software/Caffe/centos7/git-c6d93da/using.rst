

Load the module with::

  $ module load caffe/git-c6d93da

As an example, we can run caffe with and without python on an interactive node like this::

  # With python 

  $ module caffe/git-c6d93da
  $ ipython
  In [1]: import caffe
  In [2]: ...


  # Without python
  # Alex’s CIFAR-10 tutorial, Caffe style
  # http://caffe.berkeleyvision.org/gathered/examples/cifar10.html
  
  $ ./data/cifar10/get_cifar10.sh
  $ ./examples/cifar10/create_cifar10.sh

  $ ./examples/cifar10/train_quick.sh
  ...
  I0429 16:37:23.951550 44648 solver.cpp:404]     Test net output #1: loss = 0.721992 (* 1 = 0.721992 loss)
  I0429 16:37:23.951557 44648 solver.cpp:322] Optimization Done.
  I0429 16:37:23.951563 44648 caffe.cpp:222] Optimization Done.
  ...

