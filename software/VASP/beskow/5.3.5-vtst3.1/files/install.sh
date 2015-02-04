  # installation is following https://www.nsc.liu.se/~pla/blog/2015/01/07/vasp-cray-xc40/
  # as well as                http://theory.cm.utexas.edu/vtsttools/installation.html

  module swap PrgEnv-cray PrgEnv-intel/5.2.40
  module unload cray-libsci
  module load cray-mpich/7.0.4
  module load craype-haswell

  # set installation root
  VASP_INSTALL_ROOT=/pdc/vol/vasp/5.3.5-vtst3.1/build-02
  SCRIPT_ROOT=`pwd`

  mkdir -p $VASP_INSTALL_ROOT/src
  cd $SCRIPT_ROOT/dist
  if [ ! -f vasp.5.3.5.tar.gz ]; then
      echo "tarballs not found"
      exit 1
  fi
  tar xvzf vasp.5.3.5.tar.gz -C $VASP_INSTALL_ROOT/src
  tar xvzf vasp.5.lib.tar.gz -C $VASP_INSTALL_ROOT/src

  # get makefiles
  cd $VASP_INSTALL_ROOT/src
  wget http://www.nsc.liu.se/~pla/downloads/makefile.vasp535.crayxc40
  mv makefile.vasp535.crayxc40 makefile-pristine
  wget http://www.nsc.liu.se/~pla/downloads/makefile.vasp5lib.crayxc40
  mv makefile.vasp5lib.crayxc40 makefile-lib

  # compile lib
  ln -s $VASP_INSTALL_ROOT/src/makefile-lib $VASP_INSTALL_ROOT/src/vasp.5.lib/makefile
  cd $VASP_INSTALL_ROOT/src/vasp.5.lib
  make

  # patch the source code http://theory.cm.utexas.edu/vtsttools/download.html
  cd $VASP_INSTALL_ROOT/src
  wget http://theory.cm.utexas.edu/code/vtstcode.tgz
  tar xvzf vtstcode.tgz

  # fix for misplaced ifdef
  cp $SCRIPT_ROOT/fixes/dimer.F $VASP_INSTALL_ROOT/src/vtstcode-157

  # patch more
  cd $VASP_INSTALL_ROOT/src/vasp.5.3
  patch < ../vtstcode-157/vasp-5.3.2-main.patch
  cp ../vtstcode-157/*.F .

  # patch makefiles
  cd $VASP_INSTALL_ROOT/src
  sed "s/dos.o      elf.o      tet.o      tetweight.o hamil_rot.o/dos.o elf.o tet.o tetweight.o hamil_rot.o bfgs.o dynmat.o instanton.o lbfgs.o sd.o cg.o dimer.o bbm.o fire.o lanczos.o neb.o qm.o opt.o/g" makefile-pristine > makefile-regular

  # create other makefiles
  cd $VASP_INSTALL_ROOT/src
  sed "s/-DNGZhalf/-DNGZhalf -DwNGZhalf/g"         makefile-regular > makefile-gamma
  sed "s/-DNGZhalf//g"                             makefile-regular > makefile-noncollinear
  sed "s/-DNGZhalf/-DNGZhalf -Dtbdyn/g"            makefile-regular > makefile-tbdyn-regular
  sed "s/-DNGZhalf/-DNGZhalf -DwNGZhalf -Dtbdyn/g" makefile-regular > makefile-tbdyn-gamma
  sed "s/-DNGZhalf/-Dtbdyn/g"                      makefile-regular > makefile-tbdyn-noncollinear

  mkdir -p $VASP_INSTALL_ROOT/bin

  # compile binaries
  for target in regular gamma noncollinear tbdyn-regular tbdyn-gamma tbdyn-noncollinear; do
      cd $VASP_INSTALL_ROOT/src
      sed -i "s/MACHINE-VERSION/Beskow-$target/g" $VASP_INSTALL_ROOT/src/makefile-$target
      cp -r $VASP_INSTALL_ROOT/src/vasp.5.3 $VASP_INSTALL_ROOT/src/vasp.5.3-$target
      ln -s $VASP_INSTALL_ROOT/src/makefile-$target $VASP_INSTALL_ROOT/src/vasp.5.3-$target/makefile
      cd $VASP_INSTALL_ROOT/src/vasp.5.3-$target
      make &> compilation.log
      cp vasp $VASP_INSTALL_ROOT/bin/vasp-$target
  done

  cd $VASP_INSTALL_ROOT/bin
  ln -s vasp-regular vasp
  ln -s vasp-tbdyn-regular vasp-tbdyn
