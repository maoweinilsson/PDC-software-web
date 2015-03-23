#!/bin/bash -l
# compilation script 

#functions
function error_quit {
    echo -e "$@"
    echo
    echo -e 'Usage:'
    echo -e 'compile all|clean int|gnu|cray'
    echo -e '   second argument is optional'
    exit 1
}

# add modules to script (specific to Beskow)
#. /opt/modules/default/etc/modules.sh

# commands
cp_cmd='cp -p'
mv_cmd=mv
rm_cmd=rm
mk_cmd='mkdir -p'
# paths
NEK_HOME=$HOME/nek5_svn/trunk/nek
# setup
SETUP=jet_crf


# arguments
args=("$@")
argsnr=$#

# check argumen list
case ${argsnr} in
   1)
# single argumen defines action, assume intel compiler
      echo "No compiler specified"
      echo "Assuming intel"
      COMP=int
      ;;
   2)
# take second argumet
      COMP=${args[1]}
      ;;
   *)
      error_quit "Wrong argument list"
      ;;
esac

case "${args[0]}" in
   all)
# compile 
# create local source copy
      ${mk_cmd} ./nek
      ${mk_cmd} ./nek/jl
      ${mk_cmd} ./nek/jl/ext
      ${mk_cmd} ./nek/3rd_party
      ${cp_cmd} ${NEK_HOME}/* ./nek/
      ${cp_cmd} ${NEK_HOME}/jl/* ./nek/jl/
      ${cp_cmd} ${NEK_HOME}/jl/ext/* ./nek/jl/ext/
      ${cp_cmd} ${NEK_HOME}/3rd_party/* ./nek/3rd_party/

# adjust everything for given compiler
   case "${COMP}" in
      int)
# Intel
# swap modules
         module swap PrgEnv-cray PrgEnv-intel

# modify makenek.inc
         sed -i 's/ftn/dummy/g' ./nek/makenek.inc
         sed -i 's/ifort/ftn/g' ./nek/makenek.inc

# execute script
         ./makenek ${SETUP} ./nek

# put modules back
         module swap PrgEnv-intel PrgEnv-cray
         ;;
      gnu)
# GNU
# swap modules
         module swap PrgEnv-cray PrgEnv-gnu

# modify makenek.inc
         sed -i 's/ftn/dummy/g' ./nek/makenek.inc
         sed -i 's/gfortran/ftn/g' ./nek/makenek.inc

# execute script
         ./makenek ${SETUP} ./nek

# put modules back
         module swap PrgEnv-gnu PrgEnv-cray
         ;;
      cray)
# modify makenek.inc
         sed -i 's/-r8 -Mpreprocess/-ra -s real64 -eZ -em -rm/g' nek/makenek.inc

# execute script
         ./makenek ${SETUP} ./nek

# clean .i files
        ${rm_cmd} *.i
         ;;

      *)
         error_quit "Wrong compiler option"
         ;;
   esac

# clean directory
      ${rm_cmd} ${SETUP}.f makefile 
#      ${rm_cmd} compiler.out
        ;;
   clean)
# clean 
      ${rm_cmd} ./nek5000
      ${rm_cmd} ./obj/*
      ${rm_cmd} compiler.out
      ;;
   *) error_quit 'Wrong argument list'
      ;;
esac
