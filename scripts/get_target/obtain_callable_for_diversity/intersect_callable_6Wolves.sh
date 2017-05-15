#!/bin/bash

# This script obtains the regions that are callable across all 6 wolves individuals

. /u/local/Modules/default/init/modules.sh
module load bedtools

callableDir=../../results/get_callable

for chrNum in {01..38}
do

bedtools intersect -a ${callableDir}/gwcwx_XinXJ24/chr${chrNum}/format_callable_chr${chrNum}_gwcwx_XinXJ24_callable_loci.bed -b ${callableDir}/gwcwz_RKW3916/chr${chrNum}/format_callable_chr${chrNum}_gwcwz_RKW3916_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/gwibe_XXWIB98/chr${chrNum}/format_callable_chr${chrNum}_gwibe_XXWIB98_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/gwirw_RKW3073/chr${chrNum}/format_callable_chr${chrNum}_gwirw_RKW3073_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/gwprt_LOBO423/chr${chrNum}/format_callable_chr${chrNum}_gwprt_LOBO423_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/gwynp_RKW1547/chr${chrNum}/format_callable_chr${chrNum}_gwynp_RKW1547_callable_loci.bed > /u/home/p/phung428/nobackup-kirk/tanya_data/callable_regions_withinSpecies/6Wolves/chr${chrNum}/6Wolves_chr${chrNum}_callableSites.txt

done

chrNum=X
bedtools intersect -a ${callableDir}/gwcwx_XinXJ24/chr${chrNum}/format_callable_chr${chrNum}_gwcwx_XinXJ24_callable_loci.bed -b ${callableDir}/gwcwz_RKW3916/chr${chrNum}/format_callable_chr${chrNum}_gwcwz_RKW3916_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/gwibe_XXWIB98/chr${chrNum}/format_callable_chr${chrNum}_gwibe_XXWIB98_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/gwirw_RKW3073/chr${chrNum}/format_callable_chr${chrNum}_gwirw_RKW3073_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/gwprt_LOBO423/chr${chrNum}/format_callable_chr${chrNum}_gwprt_LOBO423_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/gwynp_RKW1547/chr${chrNum}/format_callable_chr${chrNum}_gwynp_RKW1547_callable_loci.bed > /u/home/p/phung428/nobackup-kirk/tanya_data/callable_regions_withinSpecies/6Wolves/chr${chrNum}/6Wolves_chr${chrNum}_callableSites.txt
