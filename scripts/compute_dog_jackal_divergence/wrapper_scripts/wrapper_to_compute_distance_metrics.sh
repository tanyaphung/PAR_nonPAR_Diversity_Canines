#!/bin/bash

. /u/local/Modules/default/init/modules.sh
module load python

# chrX
windows=../../../results/make_nonoverlapping_windows/50kb/chr${chrNum}_50kb_windows.bed
targets=../../../results//get_target/compute_divergence/callable_regions_in_neutral_regions_for_calc_distance/chr${i}/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions.bed
genotypes=../../../results/compute_dog_jackal_divergence/genotype_files_for_calc_distance/chr${i}/ddbox_RKWUCLA.gjtel_RKW1332.GT.FORMAT_input.txt
outFile=../../../results/compute_dog_jackal_divergence/0kb_flanking/chr${i}_Dog_Jackal_divergence_0kbFlanking.txt
python ../compute_distance_metrics.py --windows_bed ${windows} --targets_bed ${targets} --genotype_csv ${genotypes} > ${outFile}

# autosomes
for i in {01..38}
do
windows=../../../results/make_nonoverlapping_windows/50kb/chr${chrNum}_50kb_windows.bed
targets=../../../results//get_target/compute_divergence/callable_regions_in_neutral_regions_for_calc_distance/chr${i}/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions.bed
genotypes=../../../results/compute_dog_jackal_divergence/genotype_files_for_calc_distance/chr${i}/ddbox_RKWUCLA.gjtel_RKW1332.GT.FORMAT_input.txt
outFile=../../../results/compute_dog_jackal_divergence/0kb_flanking/chr${i}_Dog_Jackal_divergence_0kbFlanking.txt
python ../compute_distance_metrics.py --windows_bed ${windows} --targets_bed ${targets} --genotype_csv ${genotypes} > ${outFile}
done
