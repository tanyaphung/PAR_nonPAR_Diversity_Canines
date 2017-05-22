#!/bin/bash

### Use bedtools to generate Xkb nonoverlapping windows from the dog genome
### Usage: ./makeWindows.sh $length $lengthFileName
### For example: to make 100kn nonoverlapping windows:
### ./makeWindows.sh 100000 100kb

. /u/local/Modules/default/init/modules.sh
module load bedtools

length=$1
lengthFileName=$2
for chrNum in {01..38}
do
bedtools makewindows -g ../../data/chrLength/chr${chrNum}.g -w ${length} > ../../results/make_nonoverlapping_windows/${lengthFileName}/chr${chrNum}_${lengthFileName}_windows.bed
done

chrNum=X
bedtools makewindows -g ../../data/chrLength/chr${chrNum}.g -w ${length} > ../../results/make_nonoverlapping_windows/${lengthFileName}/chr${chrNum}_${lengthFileName}_windows.bed
