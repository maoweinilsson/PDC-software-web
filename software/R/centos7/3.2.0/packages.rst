
List Packages
-------------

To see a list of installed packages, please type::

  > installed.packages()

Install packages
----------------
  
Some packages are installed by default.
instructions at http://www.bu.edu/tech/support/research/software-and-programming/common-languages/r-basics/r-faq/
In general you can add new packages directly from within R, but to be globally accessible
they must be installed in the global repository rather than your home catalogue.::

  $ module add R
  $ R
  > .libPaths()
  [1] "/afs/pdc.kth.se/home/h/hzazzi/R/library"             
  [2] "/pdc/vol/R/3.2.0/lib64/R/library"
  
All the packages where installed in the 2nd path, which is globally accessible.
To install packages::

  > install.packages("package name",lib=.libPaths()[2])
  
Which will install [package name] in R.

**OBS** Always try to use the swedish repository for packages. There is a bug in R 3.2.2, meaning
you will get a short list of CRAN repositories. In this case choose (HTTP mirrors) and then the swedish respoitory.

========================== ==
List of installed packages
========================== ==
ape
base
boot
class
cluster
codetools
colorspace
compiler
datasets
dichromat
digest
doParallel
foreach
foreign
ggplot2
graphics
grDevices
grid
gtable
iterators
KernSmooth
labeling
lattice
magrittr
manipulate
MASS
Matrix
methods
mgcv
munsell
nlme
nnet
parallel
plyr
RColorBrewer
Rcpp
reshape2
rpart
rstudio
scales
signal
snow
spatial
splines
stats
stats4
stringi
stringr
survival
tcltk
tools
utils
========================== ==
