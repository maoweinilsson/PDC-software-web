
Instructions for using singularity at PDC
=========================================

Using existing images
---------------------

Singularity images for immediate use can be found at
::

  /pdc/vol/singularity/2.4.2/shub/

and come preloaded with various softwares.
If you would like to know what is actually
installed on the images use...
::

  singularity help <image name>
  
This images can also be used to install other applications.
See more information below under *building your own images*

By adding
::

  module add singularity/2.4.2

You will define the **PDC_SHUB** variable which can
the be used to access the singularity hub at PDC
::

  echo $PDC_SHUB

Download images from singularity hub
------------------------------------

You can find numerous images at https://singularity-hub.org/
Just download them directly to our file system and use
them for your analysis. We do recommend to use one of
our transfer nodes for downloading. The *build* command
in singularity, besides downloading the image, also converts the image to the 
latest singularity version.
::

  ssh t04n28.pdc.kth.se
  cd /cfs/klemming/nobackup/u/username
  singularity build <your image name>.simg shub://<name of image>

You can also use images from docker https://hub.docker.com
::

  singularity build <your image name>.simg docker://<name of image>

Building your own images
------------------------

Buidling your own images must be performed on **your own computer** by
installing both singularity and squashfs.

A word of advice: OpenMPI on the singularity image and on the HPC
cluster must be compatible, meaning that you have to install
the same version as you are planning to use on the cluster.
Also, OpenMPI versions lower than 2.1 do not work with our clusters.
More information at http://singularity.lbl.gov/docs-hpc

How to install singularity
^^^^^^^^^^^^^^^^^^^^^^^^^^

Singularity can be installed on your computer (root access is needed), so
you can build your own images. If you would like to use our clusters, please
see to it that you install the same version.
::

  VERSION=2.4.2
  wget https://github.com/singularityware/singularity/releases/download/$VERSION/singularity-$VERSION.tar.gz
  tar xvf singularity-$VERSION.tar.gz
  cd singularity-$VERSION
  ./configure --prefix=/usr/local
  make
  sudo make install

Install squashfs
^^^^^^^^^^^^^^^^

As of singularity 2.4 you need squash filesystem to edit and modify your images.
This can be downloaded using
::

  sudo apt-get update
  sudo apt-get install squashfs-tools 

Test singularity
^^^^^^^^^^^^^^^^

To test that everything is working is good to download and start a shell
from shub. By using this command you will automatically download and login into
your singularity image shell.
::

  singularity pull shub://vsoch/hello-world
  singularity shell vsoch-hello-world-master.simg

In the shell you can do the usual shell commands.

Download distribution of Linux
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Different Linux OS are available for you to download.
At this time the best Ubuntu distribution is available as a
docker image and can be downloaded
::

  sudo singularity build <image name>.simg docker://ubuntu:latest

Which will download this docker image and convert it into
a singularity image.
Also you can download an image from our PDC hub
explained above.

Creating writable image
^^^^^^^^^^^^^^^^^^^^^^^

In order to be able to change an image you must first copy your
default image and then make it writable.
This can be achieved by
::

  sudo singularity build --sandbox <write folder> <readonly image>.simg

Install software
^^^^^^^^^^^^^^^^

So now that you do have a writable image you can start by installing software
in the image. By login into the image you can use all the commands
that are normal in the operating system, and your internetaccess is
also available in the container, so you can use *wget* or other commands to download data and
softwares. By default you login with the user **root**
::

  sudo singularity shell -w <write folder>
  
Installing the essentials in your image
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Although you have downloaded the latest OS, it still
needs some basic software, compilers and libraries.
First you need to make it writable and then login
into the shell. After that follow this recipy for
installing the essentials.
Below is an example of installing some tools like
gcc and OpenMPI
::

  apt-get update
  apt-get install wget
  apt-get install build-essential
  apt-get install lzip
  apt-get install m4
  apt-get install libgfortran3
  wget https://gmplib.org/download/gmp/gmp-6.1.2.tar.lz
  lzip gmp-6.1.2.tar.lz
  tar xvf gmp-6.1.2.tar
  cd gmp-6.1.2
  ./configure
  make
  make install
  wget http://www.mpfr.org/mpfr-current/mpfr-3.1.6.tar.gz
  tar xvzf mpfr-3.1.6.tar.gz
  cd mpfr-3.1.6
  ./configure
  make
  make install
  wget ftp://ftp.gnu.org/gnu/mpc/mpc-1.0.3.tar.gz
  tar xvzf mpc-1.0.3.tar.gz
  cd mpc-1.0.3
  ./configure
  make
  make install
  wget https://www.zlib.net/zlib-1.2.11.tar.gz
  tar xvfp zlib-1.2.11.tar.gz
  cd zlib-1.2.11
  ./configure
  make
  make install
  wget https://ftp.gnu.org/gnu/gcc/gcc-6.2.0/gcc-6.2.0.tar.gz
  tar xvzf gcc-6.2.0.tar.gz
  cd gcc-6.2.0
  ./configure --disable-checking --enable-languages=c,c++,fortran --disable-multilib --with-system-zlib
  make
  mak install
  wget https://www.open-mpi.org/software/ompi/v3.0/downloads/openmpi-3.0.0.tar.gz
  tar xvzf openmpi-3.0.0.tar.gz
  cd openmpi-3.0.0
  ./configure
  make
  make install
  apt-get install cmake
  apt-get install python2.7
  ln -s /usr/bin/python2.7 /usr/bin/python
  
This will install the GNU compilers and libraries for MPI.

copying data from local file system to singularity sandbox
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You can copy data to your singularity sandbox in several ways.
Either by adding your files into the /root folder in singularity,
and then they will automatically be available in the /root folder
in singularity.
::

  sudo cp <your file> /root
  
You can also bind your folder in singularity.
In order to do that you must bind a folder in singularity to
your local file system. Also the folder in singularity must be created
first.
::
  
  sudo singularity exec -w ubuntu_write mkdir <singularity folder>
  sudo singularity shell --bind <local folder>:/root/<singularity folder> -w ubuntu_write/
  cp <singularity folder>/<files> .

Where to store runtime files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

As the root folder you are login into when using a writable container is
not available using exec from outside the container, if you
plan to run software that you compiled yourself, you must put
the executable somewhere that is accessible by PATH.
*/usr/local/bin* is a good example.
Installed software can then be executed by
::

  singularity exec <my image>.simg <myexe>

You can also add a software path in the containers *runscript*
which is a shell file which will be executed when you *run*
the container. The *runscript* should be stored in
**/.singularity.d/** folder
The runscript is then executed using
::

  singularity run vsoch-hello-world-master.simg

Storing help
^^^^^^^^^^^^

help documents on the image should be saved as **runscript.help**
in the folder */.singularity.d*
This can then be read by
::

  singularity help <read image>

Saving your sandbox to a singularity image
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When you are ready installing all the software, paths, folders you
need you can make your image read-only again.
This is important since images work better on the filesystem at
PDC rather than have many files in the sandbox.
An image can be created using
::

  sudo singularity build <read image>.simg <write folder>
  
Do remember that you do need Open MPI to execute your software 
on HPC systems. We provide images with Open MPI installed
in the PDC Hub, but you can also build your own
See http://singularity.lbl.gov/docs-hpc for more information.

Access your data
----------------

If you are within a read-only singularity image, you can access
data outside the image directly. Relative paths will resolve outside
the container while absolute paths will resolve inside the container.

Running singularity images
--------------------------

batch job
^^^^^^^^^

::

  #!/bin/bash -l
  # The -l above is required to get the full environment with modules
  # Set the allocation to be charged for this job
  # not required if you have set a default allocation
  #SBATCH -A 201X-X-XX
  # The name of the script is myjob
  #SBATCH -J myjob
  # Only 1 hour wall-clock time will be given to this job
  #SBATCH -t 1:00:00
  # Number of nodes
  #SBATCH --nodes=1
  # Number of MPI processes per node
  #SBATCH --ntasks-per-node=24
  #SBATCH -e error_file.e
  #SBATCH -o output_file.o
  # Run the executable named myexe with MPI-rank of 48
  # and write the output into my_output_file
  module add gcc/6.2.0 openmpi/3.0-gcc-6.2
  mpirun -n 24 singularity exec -B /cfs/klemming <my image>.simg <myexe>

Single node execute
^^^^^^^^^^^^^^^^^^^

::

  salloc -t <time> -A 201X-X-XX
  module add gcc/6.2.0 openmpi/3.0-gcc-6.2
  mpirun -n 8 singularity exec -B /cfs/klemming hello_world.simg hello_world_mpi
  
CUDA
^^^^

In order to run singularity images that do rely on GPU, you need first to
book a node that does contain a GPU, and then submit it as normal.
There is no need to define which GPU or link to the CUDA module to make it work.


