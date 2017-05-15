#!/bin/bash
#$ -cwd
#$ -V
#$ -N obtainGT.A
#$ -l h_data=4G,time=24:00:00
#$ -M eplau
#$ -m ea

. /u/local/Modules/default/init/modules.sh
module load vcftools

inDir='/u/home/p/phung428/nobackup-kirk/tanya_data/filter_GATK_variant_PAR_project'
outDir='/u/home/p/phung428/nobackup-kirk/tanya_data/genotype_files_for_calc_het_PAR_project/'

for chrNum in {01..38}
do
inVCF='6_SV_rmClusterSNP_BiSNP_SV_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf'

individuals=( ddair_RS74411 ddbas_RS80704 ddbdt_RS86407 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 ddsct_RS86393 ddwhw_RS86397 ddbox_RKWUCLA gwcwx_XinXJ24 gwcwz_RKW3916 gwibe_XXWIB98 gwirw_RKW3073 gwprt_LOBO423 gwynp_RKW1547 gjtel_RKW1332 )

for i in "${individuals[@]}"
do
vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} --indv $i --extract-FORMAT-info GT --out $outDir/'chr'${chrNum}/$i
sed 's/\t/,/g' $outDir/'chr'${chrNum}/$i.GT.FORMAT > $outDir/'chr'${chrNum}/$i.GT.FORMAT.csv
done
done
