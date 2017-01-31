#!/bin/bash

# chrX
chrNum=X
inFile='/u/nobackup/kirk/phung428/tanya_data/genotype_files_for_calc_distance/chr'${chrNum}'/ddbox_RKWUCLA.gjtel_RKW1332.GT.FORMAT.csv'
outFile='/u/nobackup/kirk/phung428/tanya_data/genotype_files_for_calc_distance/chr'${chrNum}'/ddbox_RKWUCLA.gjtel_RKW1332.GT.FORMAT_input.txt'
sed 's|/|,|g' ${inFile} > ${outFile}

# autosomes

for chrNum in {01..38}
do
inFile='/u/nobackup/kirk/phung428/tanya_data/genotype_files_for_calc_distance/chr'${chrNum}'/ddbox_RKWUCLA.gjtel_RKW1332.GT.FORMAT.csv'
outFile='/u/nobackup/kirk/phung428/tanya_data/genotype_files_for_calc_distance/chr'${chrNum}'/ddbox_RKWUCLA.gjtel_RKW1332.GT.FORMAT_input.txt'
sed 's|/|,|g' ${inFile} > ${outFile}
done
