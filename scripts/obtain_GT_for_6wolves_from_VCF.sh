#!/bin/bash

#Usage: ./obtain_GT_for_6wolves_from_VCF.sh /path/to/input/directory /path/to/output/directory

. /u/local/Modules/default/init/modules.sh
module load vcftools

inDir=$1
outDir=$2

# For chrX
chrNum=X
inVCF='6_SV_rmClusterSNP_BiSNP_SV_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf'

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} --indv gwcwx_XinXJ24 --indv gwcwz_RKW3916 --indv gwibe_XXWIB98 --indv gwirw_RKW3073 --indv gwprt_LOBO423 --indv gwynp_RWK1547 --extract-FORMAT-info GT --out $outDir/'chr'${chrNum}/6Wolves

# For autosomes

for chrNum in {01..38}
do
inVCF='6_SV_rmClusterSNP_BiSNP_SV_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf'
vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} --indv gwcwx_XinXJ24 --indv gwcwz_RKW3916 --indv gwibe_XXWIB98 --indv gwirw_RKW3073 --indv gwprt_LOBO423 --indv gwynp_RWK1547 --extract-FORMAT-info GT --out $outDir/'chr'${chrNum}/6Wolves
done

