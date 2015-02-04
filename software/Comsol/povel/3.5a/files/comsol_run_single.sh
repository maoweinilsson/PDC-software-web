#!/bin/bash

module add mesa comsol/3.5a
comsol batch -inputfile yourInput.mph -outputfile yourOutput -batchlog yourLogfile

