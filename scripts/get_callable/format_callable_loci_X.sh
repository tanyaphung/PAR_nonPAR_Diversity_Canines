#!/bin/bash

dir='/u/home/p/phung428/nobackup-kirk/tanya_data/callable_regions'
chrNum=X
individuals=( ddair_RS74411 ddbas_RS80704 ddbdt_RS86407 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 ddsct_RS86393 ddwhw_RS86397 ddbox_RKWUCLA gwcwx_XinXJ24 gwcwz_RKW3916 gwibe_XXWIB98 gwirw_RKW3073 gwprt_LOBO423 gwynp_RKW1547 gjtel_RKW1332 )

for i in "${individuals[@]}"
do

### STEP 1: Grep out the chromosome of interest

grep -w chr${chrNum} ${dir}/$i/$i'_callable_loci.bed' > ${dir}/$i/'chr'${chrNum}/'chr'${chrNum}'_'$i'_callable_loci.bed'

### STEP 2: Grep out the callbale loci

grep -w CALLABLE ${dir}/$i/'chr'${chrNum}/'chr'${chrNum}'_'$i'_callable_loci.bed' > ${dir}/$i/'chr'${chrNum}/'callable_chr'${chrNum}'_'$i'_callable_loci.bed'

### STEP 3: Grab col 1, 2, 3
awk '{print$1"\t"$2"\t"$3}' ${dir}/$i/'chr'${chrNum}/'callable_chr'${chrNum}'_'$i'_callable_loci.bed' > ${dir}/$i/'chr'${chrNum}/'format_callable_chr'${chrNum}'_'$i'_callable_loci.bed'

done
