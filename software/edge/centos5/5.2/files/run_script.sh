#!/bin/bash

# The number of cores
NPART=8

# The name of .ainp file
AINPFILE=case.ainp

# load Edge 5.2
module add edge/5.2

# Run
edge_mpi_run $AINPFILE $NPART > edge_sim.log 2>&1
