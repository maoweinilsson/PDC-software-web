#!/bin/bash

module add mesa comsol/5.0
comsol batch -inputfile yourInput.mph -outputfile yourOutput -batchlog yourLogfile

