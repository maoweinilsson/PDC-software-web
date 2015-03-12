


decided to use the gnu compiler for simplicity

module swap PrgEnv-cray PrgEnv-gnu

cd sources
change the makefile so that CC=CC

then just make -j 6 and it makes

What to do with all the files is tricky, but hopefully just
moving the 
data directory (which is also where the binaries are built) works.

i.e. mv data ../../

