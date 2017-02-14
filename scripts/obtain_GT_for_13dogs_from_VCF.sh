#!/bin/bash

#Usage: ./obtain_GT_for_13dogs_from_VCF.sh /path/to/input/directory /path/to/output/directory

. /u/local/Modules/default/init/modules.sh
module load vcftools

inDir=$1
outDir=$2

# For chrX
chrNum=X
inVCF='6_SV_rmClusterSNP_BiSNP_SV_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf'

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} --indv ddair_RS74411 --indv ddbas_RS80704 --indv ddbdt_RS86407 --indv ddbrt_RS86399 --indv ddjrt_RS86400 --indv ddjrt_RS86404 --indv ddkbt_RS74408 --indv ddlab_RS86398 --indv ddpwc_RS73323 --indv ddpwc_RS86409 --indv ddsct_RS86393 --indv ddwhw_RS86397 --indv ddbox_RKWUCLA --extract-FORMAT-info GT --out $outDir/'chr'${chrNum}/13Dogs

# For autosomes

for chrNum in {01..38}
do
inVCF='6_SV_rmClusterSNP_BiSNP_SV_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf'
vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} --indv ddair_RS74411 --indv ddbas_RS80704 --indv ddbdt_RS86407 --indv ddbrt_RS86399 --indv ddjrt_RS86400 --indv ddjrt_RS86404 --indv ddkbt_RS74408 --indv ddlab_RS86398 --indv ddpwc_RS73323 --indv ddpwc_RS86409 --indv ddsct_RS86393 --indv ddwhw_RS86397 --indv ddbox_RKWUCLA --extract-FORMAT-info GT --out $outDir/'chr'${chrNum}/13Dogs
done

