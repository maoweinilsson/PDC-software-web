#!/bin/bash

module add mesa comsol/4.2a
comsol batch -inputfile yourInput.mph -outputfile yourOutput -batchlog yourLogfile

