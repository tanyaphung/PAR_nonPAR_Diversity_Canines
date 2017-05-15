#!/bin/bash

for i in {01..38}
do
windows=../../../results/make_nonoverlapping_windows/50kb/chr${chrNum}_50kb_windows.bed
targets=../../../results/get_target/compute_diversity/flanking_exons/50kb/chr${i}/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed
summaryline=../../../results/compute_dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_summary_line_chr${i}
species1=../../../results/compute_dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_canFam3_sequence_gaps_removed
species2=../../../results/compute_dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_hg19_sequence_gaps_removed
out=../../../results/compute_dog_human_divergence/50kb_flanking/chr${i}_Dog_Human_divergence_50kbFlanking.txt
python computeDivergent_windows.py --windows ${windows} --targets_bed ${targets} --summary_lines ${summaryline} --species_1 ${species1} --species_2 ${species2} --outfile ${out}
done

i=X
windows=../../../results/make_nonoverlapping_windows/50kb/chr${chrNum}_50kb_windows.bed
targets=../../../results/get_target/compute_diversity/flanking_exons/50kb/chr${i}/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed
summaryline=../../../results/compute_dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_summary_line_chr${i}
species1=../../../results/compute_dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_canFam3_sequence_gaps_removed
species2=../../../results/compute_dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_hg19_sequence_gaps_removed
out=../../../results/compute_dog_human_divergence/50kb_flanking/chr${i}_Dog_Human_divergence_50kbFlanking.txt

python computeDivergent_windows.py --windows ${windows} --targets_bed ${targets} --summary_lines ${summaryline} --species_1 ${species1} --species_2 ${species2} --outfile ${out}
