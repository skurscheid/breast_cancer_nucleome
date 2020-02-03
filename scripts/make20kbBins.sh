#!/bin/bash

id=$(echo $1| cut -f 1 -d ".")
outDir=$2

hicMergeMatrixBins\
  --matrix ${1} --numBins 2 \
  --outFileName ${outDir}/${id}_20kb_matrix.h5

