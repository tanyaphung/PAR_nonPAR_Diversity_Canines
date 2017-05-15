#!/bin/bash

# chrX
chrNum=X
inFile='/u/nobackup/kirk/phung428/tanya_data/genotype_files_for_calc_distance/chr'${chrNum}'/ddbox_RKWUCLA.gjtel_RKW1332.GT.FORMAT'
outFile='/u/nobackup/kirk/phung428/tanya_data/genotype_files_for_calc_distance/chr'${chrNum}'/ddbox_RKWUCLA.gjtel_RKW1332.GT.FORMAT.csv'
python /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/scripts/format_genotype_files_for_calc_distance.py ${inFile} > ${outFile}

# autosomes
for chrNum in {01..38}
do
inFile='/u/nobackup/kirk/phung428/tanya_data/genotype_files_for_calc_distance/chr'${chrNum}'/ddbox_RKWUCLA.gjtel_RKW1332.GT.FORMAT'
outFile='/u/nobackup/kirk/phung428/tanya_data/genotype_files_for_calc_distance/chr'${chrNum}'/ddbox_RKWUCLA.gjtel_RKW1332.GT.FORMAT.csv'
python /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/scripts/format_genotype_files_for_calc_distance.py ${inFile} > ${outFile}
done
