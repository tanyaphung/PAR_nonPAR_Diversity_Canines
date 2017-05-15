#!/bin/bash

for i in {01..38}
do
windows=../../../results/make_nonoverlapping_windows/50kb/chr${chrNum}_50kb_windows.bed
targets=../../../results/get_target/compute_divergence/callable_regions_in_neutral_regions_for_calc_distance/chr${i}/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_125kbFlanking.bed
summaryline=../../../results/compute_dog_cat_divergence/download/canFam3.felCat8.net.axt_rmHeader_summary_line_chr${i}
species1=../../../results/compute_dog_cat_divergence/download/canFam3.felCat8.net.axt_rmHeader_canFam3_sequence_gaps_removed
species2=../../../results/compute_dog_cat_divergence/download/canFam3.felCat8.net.axt_rmHeader_felCat8_sequence_gaps_removed
out=../../../results/compute_dog_cat_divergence/125kb_flanking/chr${i}_Dog_Cat_divergence_125kbFlanking.txt

python computeDivergent_windows.py --windows ${windows} --targets_bed ${targets} --summary_lines ${summaryline} --species_1 ${species1} --species_2 ${species2} --outfile ${out}
done

i=X
windows=../../../results/make_nonoverlapping_windows/50kb/chr${chrNum}_50kb_windows.bed
targets=../../../results/get_target/compute_divergence/callable_regions_in_neutral_regions_for_calc_distance/chr${i}/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_125kbFlanking.bed
summaryline=../../../results/compute_dog_cat_divergence/download/canFam3.felCat8.net.axt_rmHeader_summary_line_chr${i}
species1=../../../results/compute_dog_cat_divergence/download/canFam3.felCat8.net.axt_rmHeader_canFam3_sequence_gaps_removed
species2=../../../results/compute_dog_cat_divergence/download/canFam3.felCat8.net.axt_rmHeader_felCat8_sequence_gaps_removed
out=../../../results/compute_dog_cat_divergence/125kb_flanking/chr${i}_Dog_Cat_divergence_125kbFlanking.txt
python computeDivergent_windows.py --windows ${windows} --targets_bed ${targets} --summary_lines ${summaryline} --species_1 ${species1} --species_2 ${species2} --outfile ${out}
