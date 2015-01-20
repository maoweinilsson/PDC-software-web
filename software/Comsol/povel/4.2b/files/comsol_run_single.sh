#!/bin/bash

module add mesa comsol/4.2b
comsol batch -inputfile yourInput.mph -outputfile yourOutput -batchlog yourLogfile

