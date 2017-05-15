#!/bin/bash

animals=( ddair_RS74411 ddbas_RS80704 ddbdt_RS86407 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 ddsct_RS86393 ddwhw_RS86397 ddbox_RKWUCLA gwcwx_XinXJ24 gwcwz_RKW3916 gwibe_XXWIB98 gwirw_RKW3073 gwprt_LOBO423 gwynp_RWK1547 gjtel_RKW1332)

# chrX
# chrNum=X
# for animal in "${animals[@]}"
# do
# Rscript compute_summary_statistics_het.R /home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses chr${chrNum} ${animal}
# done

# autosome
for chrNum in {01..38}
do
for animal in "${animals[@]}"
do
Rscript filter_based_on_callable_mean.R /home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses chr${chrNum} ${animal}
done
done