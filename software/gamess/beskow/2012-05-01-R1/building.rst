

GAMESS has a slightly complicated build system that gets confused by
the way things are done on a cray system. Building using the intel compiler.

Start with::

  ./config

selecting cray-xt+the default things.

edit compddi: modify MAXCPUS/MAXNODES::

  if ($TARGET == cray-xt) then
     set MAXCPUS=32
     set MAXNODES=1600 # bump one or both of these to match your XT
  endif

uncomment GMSPATH::

  set GMSPATH=/u/home/boatzj/gamess

Then edit compiler to be intel compiler::

  set GMS_XT_COMP = 'intel'

and set case intel::

  set CFLAGS="$CFLAGS -O3"

Then::

  ./compddi 2>&1 | tee compddi.log
  cd ..

Edit comp line 1183::

  set GMS_XT_COMP = 'intel'

Comment out line 1246::

  #set FC = ifort

Teplace on line 1259::

  set XT_OPT = "-xSSE4.2"

with::

  set XT_OPT = " "

Then compile::

  ./compall 2>&1 | tee compall.log

then need to edit lked.

Edit line 191::

   set GMS_XT_COMP = 'intel'

line 205 add::

  set LDOPTS="$LDOPTS -i8"

Then::

  ./lked gamess 01 2>&1 | tee lked.log

Note::

  Choices for some optional plug-in codes are Tinker/SIMOMM code
   skipped, using dummy file qmmm.o Both VB programs skipped, using
   dummy file vbdum.o Nuclear Electron Orbital code skipped, using
   dummy file neostb.o Natural Bond Orbital (NBO) code skipped, using
   dummy file nbostb.o MPQC code skipped, using dummy file mpqcst.o

Edit 'rungms': set GAMESSROOT, GAMESSUSER, SCR etc.

Need to add the code to allow overriding of SCR with custom gamess scratch::

 if ($?CUSTOM_GAMESS_SCRATCH) then
   echo "rungms uses custom scratch directory: $CUSTOM_GAMESS_SCRATCH"
   set SCR=$CUSTOM_GAMESS_SCRATCH/scr
   set USERSCR=$CUSTOM_GAMESS_SCRATCH/userscr
   mkdir -p $SCR
   mkdir -p $USERSCR
 else
   set LETTER=`echo $USER | cut -c1`
   set LUSTRE_SCRATCH=/cfs/klemming/scratch/$LETTER/$USER
   set LUSTRE_NOBACKUP=/cfs/klemming/nobackup/$LETTER/$USER
   set SCR=$LUSTRE_SCRATCH/gamess_scratch
   mkdir -p $SCR

   set USERSCR=$LUSTRE_NOBACKUP/gamess_scratch
   mkdir -p $USERSCR

   echo "rungms uses default scratch directory: $SCR"
 endif

Test run::

  rungms exam01.inp 01 24
