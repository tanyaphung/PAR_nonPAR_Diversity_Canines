#!/bin/bash
#$ -cwd
#$ -V
#$ -N compute_distance_50kbFlanking
#$ -l h_data=2G,time=10:00:00
#$ -M eplau
#$ -m ea

. /u/local/Modules/default/init/modules.sh
module load python

# chrX
i=X
windows=../../../results/make_nonoverlapping_windows/50kb/chr${chrNum}_50kb_windows.bed
targets=../../../results/get_target/compute_divergence/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_50kbFlanking.bed
genotypes=../../../results/compute_diversity/genotype_files_for_calc_diversity/chr${chrNum}/6Wolves.GT.FORMAT
outFile=../../../results/compute_dog_jackal_divergence/50kbFlanking/chr${i}_Dog_Jackal_divergence_50kbFlanking.txt
python ../compute_distance_metrics.py --windows_bed ${windows} --targets_bed ${targets} --genotype_csv ${genotypes} > ${outFile}

for i in {01..38}
do
windows=../../../results/make_nonoverlapping_windows/50kb/chr${chrNum}_50kb_windows.bed
targets=../../../results/get_target/compute_divergence/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_50kbFlanking.bed
genotypes=../../../results/compute_diversity/genotype_files_for_calc_diversity/chr${chrNum}/6Wolves.GT.FORMAT
outFile=../../../results/compute_dog_jackal_divergence/50kbFlanking/chr${i}_Dog_Jackal_divergence_50kbFlanking.txt
python ../compute_distance_metrics.py --windows_bed ${windows} --targets_bed ${targets} --genotype_csv ${genotypes} > ${outFile}
done
