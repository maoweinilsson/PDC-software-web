
The following script was tested::

  library(parallel)
  library(snow)
  cl=makeCluster(8)
  clusterEvalQ(cl,R.version.string)
  stopCluster(cl)

Save it and run it using::

  $ module add R
  $ salloc -A <your-project-ID> -N 1 -t 60 mpirun -np 8 R --no-save <[myscript]
  
