#!/bin/bash
#$ -cwd
#$ -V
#$ -N intersect
#$ -l h_data=4G,time=24:00:00
#$ -M eplau
#$ -m ea

. /u/local/Modules/default/init/modules.sh
module load bedtools

callableDir='/u/home/p/phung428/nobackup-kirk/tanya_data/callable_regions'
for chrNum in {01..38}
do

bedtools intersect -a ${callableDir}/ddair_RS74411/chr${chrNum}/format_callable_chr${chrNum}_ddair_RS74411_callable_loci.bed -b ${callableDir}/ddbas_RS80704/chr${chrNum}/format_callable_chr${chrNum}_ddbas_RS80704_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddbdt_RS86407/chr${chrNum}/format_callable_chr${chrNum}_ddbdt_RS86407_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddbrt_RS86399/chr${chrNum}/format_callable_chr${chrNum}_ddbrt_RS86399_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddjrt_RS86400/chr${chrNum}/format_callable_chr${chrNum}_ddjrt_RS86400_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddjrt_RS86404/chr${chrNum}/format_callable_chr${chrNum}_ddjrt_RS86404_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddkbt_RS74408/chr${chrNum}/format_callable_chr${chrNum}_ddkbt_RS74408_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddlab_RS86398/chr${chrNum}/format_callable_chr${chrNum}_ddlab_RS86398_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddpwc_RS73323/chr${chrNum}/format_callable_chr${chrNum}_ddpwc_RS73323_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddpwc_RS86409/chr${chrNum}/format_callable_chr${chrNum}_ddpwc_RS86409_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddsct_RS86393/chr${chrNum}/format_callable_chr${chrNum}_ddsct_RS86393_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddwhw_RS86397/chr${chrNum}/format_callable_chr${chrNum}_ddwhw_RS86397_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddbox_RKWUCLA/chr${chrNum}/format_callable_chr${chrNum}_ddbox_RKWUCLA_callable_loci.bed > /u/home/p/phung428/nobackup-kirk/tanya_data/callable_regions_withinSpecies/13Dogs/chr${chrNum}/13Dogs_chr${chrNum}_callableSites.txt

done

chrNum=X
bedtools intersect -a ${callableDir}/ddair_RS74411/chr${chrNum}/format_callable_chr${chrNum}_ddair_RS74411_callable_loci.bed -b ${callableDir}/ddbas_RS80704/chr${chrNum}/format_callable_chr${chrNum}_ddbas_RS80704_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddbdt_RS86407/chr${chrNum}/format_callable_chr${chrNum}_ddbdt_RS86407_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddbrt_RS86399/chr${chrNum}/format_callable_chr${chrNum}_ddbrt_RS86399_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddjrt_RS86400/chr${chrNum}/format_callable_chr${chrNum}_ddjrt_RS86400_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddjrt_RS86404/chr${chrNum}/format_callable_chr${chrNum}_ddjrt_RS86404_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddkbt_RS74408/chr${chrNum}/format_callable_chr${chrNum}_ddkbt_RS74408_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddlab_RS86398/chr${chrNum}/format_callable_chr${chrNum}_ddlab_RS86398_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddpwc_RS73323/chr${chrNum}/format_callable_chr${chrNum}_ddpwc_RS73323_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddpwc_RS86409/chr${chrNum}/format_callable_chr${chrNum}_ddpwc_RS86409_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddsct_RS86393/chr${chrNum}/format_callable_chr${chrNum}_ddsct_RS86393_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddwhw_RS86397/chr${chrNum}/format_callable_chr${chrNum}_ddwhw_RS86397_callable_loci.bed | bedtools intersect -a stdin -b ${callableDir}/ddbox_RKWUCLA/chr${chrNum}/format_callable_chr${chrNum}_ddbox_RKWUCLA_callable_loci.bed > /u/home/p/phung428/nobackup-kirk/tanya_data/callable_regions_withinSpecies/13Dogs/chr${chrNum}/13Dogs_chr${chrNum}_callableSites.txt