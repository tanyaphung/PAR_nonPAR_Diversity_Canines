#!/bin/bash

for i in {01..38} 
do
windows=../../../results/make_nonoverlapping_windows/50kb/chr${chrNum}_50kb_windows.bed
targets=../../../results/get_target/get_neutral_regions/chr${i}/4.sort.merge.complement_chr${i}_ensembleGenes.repeatMasker.microsat.simpleRepeats.bed
summaryline=../../../results/compute_dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_summary_line_chr${i}
species1=../../../results/compute_dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_canFam3_sequence_gaps_removed
species2=../../../results/compute_dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_hg19_sequence_gaps_removed
out=../../../results/compute_dog_human_divergence/0kb_flanking/chr${i}_Dog_Human_divergence_0kbFlanking.txt

python computeDivergent_windows.py --windows ${windows} --targets_bed ${targets} --summary_lines ${summaryline} --species_1 ${species1} --species_2 ${species2} --outfile ${out}
done

i=X
windows=../../../results/make_nonoverlapping_windows/50kb/chr${chrNum}_50kb_windows.bed
targets=../../../results/get_target/get_neutral_regions/chr${i}/4.sort.merge.complement_chr${i}_ensembleGenes.repeatMasker.microsat.simpleRepeats.bed
summaryline=../../../results/compute_dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_summary_line_chr${i}
species1=../../../results/compute_dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_canFam3_sequence_gaps_removed
species2=../../../results/compute_dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_hg19_sequence_gaps_removed
out=../../../results/compute_dog_human_divergence/0kb_flanking/chr${i}_Dog_Human_divergence_0kbFlanking.txt

python computeDivergent_windows.py --windows ${windows} --targets_bed ${targets} --summary_lines ${summaryline} --species_1 ${species1} --species_2 ${species2} --outfile ${out}

