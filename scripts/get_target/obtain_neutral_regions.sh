#!/bin/bash
. /u/local/Modules/default/init/modules.sh
module load bedtools

usage()
{
echo './1_obtain_neutralRegions.sh file1 file2 file3 file4 outDir name1 name2 name3 name4 chrName 
where file1, file2, file3, and file4 are the bed files you want to concat.
Right now this script is hard-coded to process 4 input files and the output files are stored in outDir.
Please edit the script if you want to have more than 4 input files'
exit
}
if [ "$#" -le 1 ]
then
  usage
fi
#

if [ ! -d ${5}/${6}.${7}.${8}.${9}_concat ]
then
mkdir ${5}/${6}.${7}.${8}.${9}_concat
fi

mkdir ${5}/${6}.${7}.${8}.${9}_concat/${10}

#1. Concatenate the desired files
cat ${1} ${2} ${3} ${4} >> ${5}/${6}.${7}.${8}.${9}_concat/${10}/1.${10}_${6}.${7}.${8}.${9}.bed 

#2. Sort the file because bedtools requires the input to be sorted
sort -n -k 2,2 ${5}/${6}.${7}.${8}.${9}_concat/${10}/1.${10}_${6}.${7}.${8}.${9}.bed > ${5}/${6}.${7}.${8}.${9}_concat/${10}/2.sort_${10}_${6}.${7}.${8}.${9}.bed

#3. Bedtools merge
bedtools merge -i ${5}/${6}.${7}.${8}.${9}_concat/${10}/2.sort_${10}_${6}.${7}.${8}.${9}.bed > ${5}/${6}.${7}.${8}.${9}_concat/${10}/3.sort.merge_${10}_${6}.${7}.${8}.${9}.bed

#4. Bedtools complement
bedtools complement -i ${5}/${6}.${7}.${8}.${9}_concat/${10}/3.sort.merge_${10}_${6}.${7}.${8}.${9}.bed -g /u/project/klohmuel/tanya_data/Canines_Project_Data/ensembleGenes/canFam3.1_${10}_genome > ${5}/${6}.${7}.${8}.${9}_concat/${10}/4.sort.merge.complement_${10}_${6}.${7}.${8}.${9}.bed
