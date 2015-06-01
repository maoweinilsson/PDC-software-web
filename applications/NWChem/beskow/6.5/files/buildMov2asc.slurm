#!/bin/bash --login

#SBATCH -J build-nwchem

#SBATCH -t 08:00:00

# number of nodes
#SBATCH --nodes 1

#SBATCH -o stdout.txt
#SBATCH -e stderr.txt

module swap PrgEnv-cray PrgEnv-intel
module load craype-hugepages64M
module load dmapp
module load nwchem

# please adapt this path:
cd /pdc/vol/nwchem/6.5/build-01/src/nwchem-6.5/contrib/mov2asc


# Need to add the following libraries to Makefile: -L/pdc/vol/nwchem/6.5/build-01/src/nwchem-6.5/lib/LINUX64 -lnwcutil -ldmapp
# It also need to use FFLAGS=-i8 in Makefie
# The new Makefile is as follow:

echo "
# Change makefile and add the following libraries:
# 



# Makefile for movecs <--> ASCII translators
# \$Id: Makefile 23136 2012-11-21 18:50:12Z d3y133 $

# Tested on KSR, Cray-T3D
# Requires NWCHEM_TARGET to be set.
# Requires NWChem includes and library for MA (in libnwcutil.a)

ifeq (\$(NWCHEM_TARGET),CRAY-T3D) # (must run on MPP not host)
   FFLAGS = -Wf\"-dp\" -Wp\"-F\" -Ccray-t3d 
endif

ifeq (\$(NWCHEM_TARGET),CRAY-T3E)
   FFLAGS = -O 1 -d p -F
   FC     = f90
endif

ifeq (\$(NWCHEM_TARGET),LINUX)
   FFLAGS = -fno-second-underscore
endif
ifeq (\$(NWCHEM_TARGET),LINUX64)
  ifeq (\$(FC),gfortran)
   FFLAGS = -fdefault-integer-8
  else
#   FFLAGS = -i8
   FFLAGS =
  endif	
endif

FFLAGS=-i8

ifeq (\$(NWCHEM_TARGET),KSR)
   FFLAGS = -r8
endif

ifeq (\$(NWCHEM_TARGET),IBM)
   FFLAGS = -qEXTNAME
endif

ifeq (\$(NWCHEM_TARGET),IBM)
   CPPFLAGS = -WF,\"-I../../src/tools/install/include\"		# Needs MA includes
else
   CPPFLAGS = -I../../src/tools/install/include			# Needs MA includes
endif
LDFLAGS = -L../../src/tools/install/lib -lga -larmci	-L/pdc/vol/nwchem/6.5/build-01/src/nwchem-6.5/lib/LINUX64 -lnwcutil -ldmapp# Needs MA library
ifeq (\$(USE_MPI),y)
  LDFLAGS += -L../../lib/\${NWCHEM_TARGET} -lnwcutil
  ifneq (\$(MPI_LIB),)
    LDFLAGS += \$(patsubst -L-L%,-L%,-L\${MPI_LIB})
  endif
  ifneq (\$(LIBMPI),)
    LDFLAGS += \${LIBMPI}
  endif
endif
COMM_LIBS=  \$(shell grep ARMCI_NETWORK_LIBS\ = \${NWCHEM_TOP}/src/tools/build/Makefile | cut -b 22-)
LDFLAGS += \$(COMM_LIBS)

all:    mov2asc asc2mov

mov2asc:	mov2asc.o
	\${FC} \${FFLAGS} \${CPPFLAGS} -o \$@ $^ \${LDFLAGS} 

asc2mov:	asc2mov.o
	\${FC} \${FFLAGS} \${CPPFLAGS} -o \$@ $^ \${LDFLAGS} 


clean realclean:
	\$(RM) *.o mov2asc asc2mov



%.o:	%.F
	\$(FC) -c \$(FFLAGS) \$(CPPFLAGS) \$<

%.o:	%.f
	\$(FC) -c \$(FFLAGS) \$<

%.o:	%.c
	\$(CC) -c \$(CPPFLAGS) \$(CFLAGS) \$<

" >> Makefile_new


make -f Makefile_new FC=ftn
