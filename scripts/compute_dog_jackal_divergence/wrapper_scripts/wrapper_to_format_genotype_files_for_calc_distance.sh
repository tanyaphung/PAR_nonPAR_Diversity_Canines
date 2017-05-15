#!/bin/bash

# chrX
chrNum=X
inFile=../../../results/compute_dog_jackal_divergence/genotype_files_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332.GT.FORMAT
outFile=../../../results/compute_dog_jackal_divergence/genotype_files_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332.GT.FORMAT.csv
python ../format_genotype_files_for_calc_distance.py ${inFile} > ${outFile}

# autosomes
for chrNum in {01..38}
do
inFile=../../../results/compute_dog_jackal_divergence/genotype_files_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332.GT.FORMAT
outFile=../../../results/compute_dog_jackal_divergence/genotype_files_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332.GT.FORMAT.csv
python ../format_genotype_files_for_calc_distance.py ${inFile} > ${outFile}
done
