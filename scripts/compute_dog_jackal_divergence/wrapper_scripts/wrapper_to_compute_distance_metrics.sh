#!/bin/bash
#$ -cwd
#$ -V
#$ -N compute_distance
#$ -l h_data=2G,time=10:00:00
#$ -M eplau
#$ -m ea

. /u/local/Modules/default/init/modules.sh
module load python

# chrX
python /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/scripts/compute_distance_metrics.py --windows_bed ~/tanya_data_storage/Canines_Project_Data/canFam3.1_50kb_nonoverlapping_windows/chrX_50kb_windows.bed --targets_bed /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions.bed --genotype_csv /u/nobackup/kirk/phung428/tanya_data/genotype_files_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332.GT.FORMAT_input.txt > /u/home/p/phung428/nobackup-kirk/tanya_data/R_ddbox_RKWUCLA.gjtel_RKW1332_distance/chrX_ddbox_RKWUCLA.gjtel_RKW1332_distance.txt

for i in {01..38}
do
windows='/u/project/klohmuel/tanya_data/Canines_Project_Data/canFam3.1_50kb_nonoverlapping_windows/chr'${i}'_50kb_windows.bed'
targets='/u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chr'${i}'/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions.bed'
genotypes='/u/nobackup/kirk/phung428/tanya_data/genotype_files_for_calc_distance/chr'${i}'/ddbox_RKWUCLA.gjtel_RKW1332.GT.FORMAT_input.txt'
outFile='/u/home/p/phung428/nobackup-kirk/tanya_data/R_ddbox_RKWUCLA.gjtel_RKW1332_distance/chr'${i}'_ddbox_RKWUCLA.gjtel_RKW1332_distance.txt'
python /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/scripts/compute_distance_metrics.py --windows_bed ${windows} --targets_bed ${targets} --genotype_csv ${genotypes} > ${outFile}
done
