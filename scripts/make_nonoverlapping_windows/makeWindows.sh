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
bedtools makewindows -g /u/home/p/phung428/tanya_data_storage/Canines_Project_Data/chrLength/chr${chrNum}.g -w ${length} > /u/home/p/phung428/tanya_data_storage/Canines_Project_Data/canFam3.1_${lengthFileName}_nonoverlapping_windows/chr${chrNum}_${lengthFileName}_windows.bed
done

chrNum=X
bedtools makewindows -g /u/home/p/phung428/tanya_data_storage/Canines_Project_Data/chrLength/chr${chrNum}.g -w ${length} > /u/home/p/phung428/tanya_data_storage/Canines_Project_Data/canFam3.1_${lengthFileName}_nonoverlapping_windows/chr${chrNum}_${lengthFileName}_windows.bed
