#!/bin/bash

#Usage: ./intersect_callableRegionsWithinSpecies_neutralRegions.sh /path/to/neutral/region/directory /path/to/callable/directory /path/to/output/directory 

. /u/local/Modules/default/init/modules.sh
module load bedtools

neutralDir=$1

callableDir=$2

outDir=$3

chrNum=X

bedtools intersect -a ${neutralDir}/'chr'${chrNum}/'4.sort.merge.complement_chr'${chrNum}'_ensembleGenes.repeatMasker.microsat.simpleRepeats.bed' -b ${callableDir}/chr${chrNum}/6Wolves_chr${chrNum}_callableSites.txt > ${outDir}/chr${chrNum}/6Wolves_chr${chrNum}_callableSites_in_neutralRegions.txt

for chrNum in {01..38}
do
bedtools intersect -a ${neutralDir}/'chr'${chrNum}/'4.sort.merge.complement_chr'${chrNum}'_ensembleGenes.repeatMasker.microsat.simpleRepeats.bed' -b ${callableDir}/chr${chrNum}/6Wolves_chr${chrNum}_callableSites.txt > ${outDir}/chr${chrNum}/6Wolves_chr${chrNum}_callableSites_in_neutralRegions.txt
done
