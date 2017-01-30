#!/bin/bash

#Usage: ./obtain_GT_for_1_ind_from_VCF.sh /path/to/VCF /path/to/outputdirectory chrNum
. /u/local/Modules/default/init/modules.sh
module load vcftools

inVCF=$1
outDir=$2
chrNum=$3

individuals=( ddair_RS74411 ddbas_RS80704 ddbdt_RS86407 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 ddsct_RS86393 ddwhw_RS86397 ddbox_RKWUCLA gwcwx_XinXJ24 gwcwz_RKW3916 gwibe_XXWIB98 gwirw_RKW3073 gwprt_LOBO423 gwynp_RKW1547 gjtel_RKW1332 )

for i in "${individuals[@]}"
do
vcftools --vcf ${inDir}/'chr'${chrNum}/${inVCF} --indv $i --extract-FORMAT-info GT --out $outDir/'chr'${chrNum}/$i
sed 's/\t/,/g' $outDir/'chr'${chrNum}/$i.GT.FORMAT > $outDir/'chr'${chrNum}/$i.GT.FORMAT.csv
done
