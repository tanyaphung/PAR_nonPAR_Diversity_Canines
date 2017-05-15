#!/bin/bash
. /u/local/Modules/default/init/modules.sh
module load bedtools

ensembleFlanking=$1
repeatMasker=$2
microSat=$3
simpleRepeats=$4
OutDir=$5
chr=$6

#1. Concatenate the desired files
cat ${ensembleFlanking} ${repeatMasker} ${microSat} ${simpleRepeats} >> ${OutDir}/${chr}/1_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed

#2. Sort the file because bedtools requires the input to be sorted
sort -n -k 2,2 ${OutDir}/${chr}/1_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed > ${OutDir}/${chr}/2_sort_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed

#3. Bedtools merge
bedtools merge -i ${OutDir}/${chr}/2_sort_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed > ${OutDir}/${chr}/3_sort_merge_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed

#4. Bedtools complement
bedtools complement -i ${OutDir}/${chr}/3_sort_merge_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed -g /u/project/klohmuel/tanya_data/Canines_Project_Data/ensembleGenes/canFam3.1_${chr}_genome > ${OutDir}/${chr}/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed

