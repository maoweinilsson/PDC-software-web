#!/bin/bash

module add mesa comsol/4.3.2.189
comsol batch -inputfile yourInput.mph -outputfile yourOutput -batchlog yourLogfile

