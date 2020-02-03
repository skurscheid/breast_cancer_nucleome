#!/bin/bash

id=$(echo $1| cut -f 1 -d ".")
outDir=$2

if [ ! -d $outDir ]; then mkdir $outDir; fi

hicFindTADs --matrix $1\
  --minDepth 60000 --maxDepth 120000 --numberOfProcessors 8 --step 20000 \
  --outPrefix TADs/${id}_TADs_20kb-Bins  --minBoundaryDistance 80000 \
  --chromosomes 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X\
  --correctForMultipleTesting fdr --threshold 0.05
