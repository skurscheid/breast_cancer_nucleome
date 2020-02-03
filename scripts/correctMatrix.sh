#!/bin/bash

id=$(echo $1| cut -f 1 -d ".")
outDir=$2

if [ ! -d $outDir ]; then mkdir $outDir; fi

hicCorrectMatrix correct\
  --matrix ${1}\
  --chromosomes 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X\
  --filterThreshold $3 $4 --perchr --outFileName ${id}_corrected_20kb.h5
