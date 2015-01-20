#!/bin/bash

module add mesa comsol/4.4
comsol batch -inputfile yourInput.mph -outputfile yourOutput -batchlog yourLogfile

