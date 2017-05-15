#!/bin/bash
#$ -cwd
#$ -V
#$ -N DogHumanDiv_75kbFlanking
#$ -l highp,h_data=12G,time=24:00:00
#$ -M eplau
#$ -m ea

for i in {01..38} 
do
windows=/u/project/klohmuel/tanya_data/Canines_Project_Data/canFam3.1_50kb_nonoverlapping_windows/chr${i}_50kb_windows.bed
targets=/u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/flanking_exons/75kb/chr${i}/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed
summaryline=/u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_summary_line_chr${i}
species1=/u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_canFam3_sequence_gaps_removed
species2=/u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_hg19_sequence_gaps_removed
out=/u/home/p/phung428/nobackup-kirk/tanya_data/R_divergence_flanking_exons/75kbFlanking/Dog_Human/chr${i}_Dog_Human_divergence_75kbFlanking.txt
python computeDivergent_windows.py --windows ${windows} --targets_bed ${targets} --summary_lines ${summaryline} --species_1 ${species1} --species_2 ${species2} --outfile ${out}
done

i=X
windows=/u/project/klohmuel/tanya_data/Canines_Project_Data/canFam3.1_50kb_nonoverlapping_windows/chr${i}_50kb_windows.bed
targets=/u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/flanking_exons/75kb/chr${i}/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed
summaryline=/u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_summary_line_chr${i}
species1=/u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_canFam3_sequence_gaps_removed
species2=/u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/dog_human_divergence/download/canFam3.hg19.net.axt_rmHeader_hg19_sequence_gaps_removed
out=/u/home/p/phung428/nobackup-kirk/tanya_data/R_divergence_flanking_exons/75kbFlanking/Dog_Human/chr${i}_Dog_Human_divergence_75kbFlanking.txt

python computeDivergent_windows.py --windows ${windows} --targets_bed ${targets} --summary_lines ${summaryline} --species_1 ${species1} --species_2 ${species2} --outfile ${out}

