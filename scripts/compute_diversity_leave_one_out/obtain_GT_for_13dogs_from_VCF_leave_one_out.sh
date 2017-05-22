#!/bin/bash
#$ -cwd
#$ -V
#$ -N GT
#$ -l h_data=4G,time=24:00:00
#$ -M eplau
#$ -m ea

. /u/local/Modules/default/init/modules.sh
module load vcftools

inDir=../../results/GATK_Variant_Calling/filter_GATK_variant_PAR_project
outDir=../../results/compute_diversity_leave_one_out/genotype_files_for_calc_diversity

all_individuals=( ddair_RS74411 ddbas_RS80704 ddbdt_RS86407 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 ddsct_RS86393 ddwhw_RS86397 ddbox_RKWUCLA )

leave_out_airedale=( ddbas_RS80704 ddbdt_RS86407 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 ddsct_RS86393 ddwhw_RS86397 ddbox_RKWUCLA)

leave_out_basenji=( ddair_RS74411 ddbdt_RS86407 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 ddsct_RS86393 ddwhw_RS86397 ddbox_RKWUCLA )

leave_out_border_terrier=( ddair_RS74411 ddbas_RS80704 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 ddsct_RS86393 ddwhw_RS86397 ddbox_RKWUCLA )

leave_out_black_russian=( ddair_RS74411 ddbas_RS80704 ddbdt_RS86407 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 ddsct_RS86393 ddwhw_RS86397 ddbox_RKWUCLA )

leave_out_jack_russell=( ddair_RS74411 ddbas_RS80704 ddbdt_RS86407 ddbrt_RS86399 ddkbt_RS74408 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 ddsct_RS86393 ddwhw_RS86397 ddbox_RKWUCLA )

leave_out_kerry_blue=( ddair_RS74411 ddbas_RS80704 ddbdt_RS86407 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 ddsct_RS86393 ddwhw_RS86397 ddbox_RKWUCLA )

leave_out_lab=( ddair_RS74411 ddbas_RS80704 ddbdt_RS86407 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddpwc_RS73323 ddpwc_RS86409 ddsct_RS86393 ddwhw_RS86397 ddbox_RKWUCLA )

leave_out_corgi=( ddair_RS74411 ddbas_RS80704 ddbdt_RS86407 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddlab_RS86398 ddsct_RS86393 ddwhw_RS86397 ddbox_RKWUCLA )

leave_out_scottish_terrier=( ddair_RS74411 ddbas_RS80704 ddbdt_RS86407 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 ddwhw_RS86397 ddbox_RKWUCLA )

leave_out_west_highland=( ddair_RS74411 ddbas_RS80704 ddbdt_RS86407 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 ddsct_RS86393 ddbox_RKWUCLA )

leave_out_boxer=( ddair_RS74411 ddbas_RS80704 ddbdt_RS86407 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 ddsct_RS86393 ddwhw_RS86397 )

#########
## chrX
#########
chrNum=X
inVCF='6_SV_rmClusterSNP_BiSNP_SV_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf'

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_airedale[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_airedale

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_basenji[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_basenji

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_border_terrier[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_border_terrier

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_black_russian[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_black_russian

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_jack_russell[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_jack_russell

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_kerry_blue[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_kerry_blue

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_lab[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_lab

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_corgi[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_corgi

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_scottish_terrier[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_scottish_terrier

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_west_highland[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_west_highland

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_boxer[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_boxer

############
## autosomes
############
for chrNum in {01..38}
do
inVCF='6_SV_rmClusterSNP_BiSNP_SV_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf'
vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_airedale[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_airedale

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_basenji[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_basenji

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_border_terrier[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_border_terrier

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_black_russian[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_black_russian

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_jack_russell[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_jack_russell

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_kerry_blue[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_kerry_blue

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_lab[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_lab

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_corgi[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_corgi

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_scottish_terrier[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_scottish_terrier

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_west_highland[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_west_highland

vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} $(for individual in "${leave_out_boxer[@]}"; do echo "--indv ${individual}"; done) --extract-FORMAT-info GT --out $outDir/chr${chrNum}/chr${chrNum}_leave_out_boxer
done



