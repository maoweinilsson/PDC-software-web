
Keras is build upon tensorflow. The package can be loaded in the following way:
::

  $ module add cudnn/5.1-cuda-8.0
  $ module load anaconda/py35/4.2.0
  $ source activate tensorflow
  $ python
  $ from keras.models import Sequential
  $ source deactivate
  
(6th step is typed after you close the python)

