#!/bin/bash
#$ -cwd
#$ -V
#$ -N het_1TO9
#$ -l h_data=1G,time=10:00:00
#$ -M eplau
#$ -m ea
#$ -t 10-38:1

. /u/local/Modules/default/init/modules.sh
module load python

individuals=( ddair_RS74411 ddbas_RS80704 ddbdt_RS86407 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 ddsct_RS86393 ddwhw_RS86397 ddbox_RKWUCLA gwcwx_XinXJ24 gwcwz_RKW3916 gwibe_XXWIB98 gwirw_RKW3073 gwprt_LOBO423 gwynp_RWK1547 gjtel_RKW1332 )
chrNum=${SGE_TASK_ID}
for i in "${individuals[@]}"
do

python /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/scripts/compute_per_individual_het.py --windows_bed '/u/project/klohmuel/tanya_data/Canines_Project_Data/canFam3.1_50kb_nonoverlapping_windows/chr'${chrNum}'_50kb_windows.bed' --targets_bed '/u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions/'$i'/chr'${chrNum}'/'$i'_chr'${chrNum}'_callable_sites_in_neutral_regions.bed' --genotype_csv '/u/nobackup/kirk/phung428/tanya_data/genotype_files_for_calc_het_PAR_project/chr'${chrNum}'/'$i'.GT.FORMAT.csv' --outfile '/u/home/p/phung428/nobackup-kirk/tanya_data/R_per_individual_heterozygosity_PAR_project/'$i'/chr'${chrNum}'/'$i'_chr'${chrNum}_per_individual_heterozygosity.txt
done
