#!/bin/bash

#Usage: ./intersect_callableRegions_neutralRegions.sh /path/to/neutral/region/directory /path/to/callable/directory /path/to/output/directory chrNum

. /u/local/Modules/default/init/modules.sh
module load bedtools

neutralDir=$1

callableDir=$2

outDir=$3

individuals=( ddair_RS74411 ddbas_RS80704 ddbdt_RS86407 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 ddsct_RS86393 ddwhw_RS86397 ddbox_RKWUCLA gwcwx_XinXJ24 gwcwz_RKW3916 gwibe_XXWIB98 gwirw_RKW3073 gwprt_LOBO423 gwynp_RKW1547 gjtel_RKW1332 )

chrNum=$4

for i in "${individuals[@]}"
do

bedtools intersect -a ${neutralDir}/'chr'${chrNum}/'4.sort.merge.complement_chr'${chrNum}'_ensembleGenes.repeatMasker.microsat.simpleRepeats.bed' -b ${callableDir}/$i/'chr'${chrNum}/'format_callable_chr'${chrNum}'_'$i'_callable_loci.bed' > ${outDir}/$i/'chr'${chrNum}/$i'_chr'${chrNum}'_callable_sites_in_neutral_regions.bed'
done
