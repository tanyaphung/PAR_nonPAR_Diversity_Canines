#!/bin/bash

#Usage: ./obtain_GT_for_2_ind_from_VCF.sh /path/to/input/directory /path/to/output/directory

. /u/local/Modules/default/init/modules.sh
module load vcftools

inDir=$1
outDir=$2

# For chrX
chrNum=X
inVCF='6_SV_rmClusterSNP_BiSNP_SV_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf'

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} --indv ddbox_RKWUCLA --indv gjtel_RKW1332 --extract-FORMAT-info GT --out $outDir/'chr'${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332

# For autosomes

for chrNum in {01..38}
do
inVCF='6_SV_rmClusterSNP_BiSNP_SV_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf'
vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} --indv ddbox_RKWUCLA --indv gjtel_RKW1332 --extract-FORMAT-info GT --out $outDir/'chr'${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332
done

