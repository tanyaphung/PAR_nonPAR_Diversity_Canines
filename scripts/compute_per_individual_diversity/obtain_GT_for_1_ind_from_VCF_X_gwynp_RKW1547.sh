#!/bin/bash
. /u/local/Modules/default/init/modules.sh
module load vcftools

inDir='/u/home/p/phung428/nobackup-kirk/tanya_data/filter_GATK_variant_PAR_project'
outDir='/u/home/p/phung428/nobackup-kirk/tanya_data/genotype_files_for_calc_het_PAR_project/'

chrNum=X
inVCF='6_SV_rmClusterSNP_BiSNP_SV_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf'


vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} --indv gwynp_RWK1547 --extract-FORMAT-info GT --out $outDir/'chr'${chrNum}/gwynp_RWK1547
sed 's/\t/,/g' $outDir/'chr'${chrNum}/gwynp_RWK1547.GT.FORMAT > $outDir/'chr'${chrNum}/gwynp_RWK1547.GT.FORMAT.csv
