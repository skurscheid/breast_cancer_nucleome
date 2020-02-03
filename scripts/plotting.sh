#!/bin/bash

export megabaseDir="/home/sebastian/mount/raijin/mcf10a-hic/hicexplorer/hicMergeMatrixBins/100/hicBuildMatrix_bin/10000"

id=$(echo $1|cut -f 1 -d ".")

if [ ! -d plots ]; then mkdir plots; fi

hicPlotMatrix\
  --matrix ${megabaseDir}/${1}\
  --log1p\
  --dpi 300\
  --clearMaskedBins\
  --chromosomeOrder 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X\
  --colorMap jet\
  --title "Hi-C matrix for ${id}"\
  --outFileName plots/${id}.pdf
