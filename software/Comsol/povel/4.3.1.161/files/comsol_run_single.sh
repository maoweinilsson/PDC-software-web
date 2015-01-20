#!/bin/bash

module add mesa comsol/4.3.1.161
comsol batch -inputfile yourInput.mph -outputfile yourOutput -batchlog yourLogfile

