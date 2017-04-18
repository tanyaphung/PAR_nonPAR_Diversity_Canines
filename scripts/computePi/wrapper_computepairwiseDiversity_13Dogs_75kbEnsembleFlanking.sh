#!/bin/bash
#$ -cwd
#$ -V
#$ -N Div13D_75kbFlanking
#$ -l highp,h_data=4G,time=24:00:00
#$ -M eplau
#$ -m ea

#chrX
chrNum=X

windows=/u/project/klohmuel/tanya_data/Canines_Project_Data/canFam3.1_50kb_nonoverlapping_windows/chr${chrNum}_50kb_windows.bed
targets=/u/nobackup/kirk/phung428/tanya_data/flanking_exons/callable_regions_withinSpecies_in_neutral_regions_75kbFlanking/13Dogs/13Dogs_chr${chrNum}_callableSites_in_neutralRegions.txt
variants=/u/nobackup/kirk/phung428/tanya_data/genotype_files_for_calc_diversity/chr${chrNum}/13Dogs.GT.FORMAT
numAllele=26
out=/u/home/p/phung428/nobackup-kirk/tanya_data/R_diversity_flanking_exons/R_diversity_75kbFlanking/13Dogs/chr${chrNum}_13Dogs_diversity_75kbFlanking.txt

python compute_pairwiseDiversity.py --windows_bed ${windows} --targets_bed ${targets} --variants ${variants} --numAllele ${numAllele} --outfile ${out}

for chrNum in {01..38}
do
windows=/u/project/klohmuel/tanya_data/Canines_Project_Data/canFam3.1_50kb_nonoverlapping_windows/chr${chrNum}_50kb_windows.bed
targets=/u/nobackup/kirk/phung428/tanya_data/flanking_exons/callable_regions_withinSpecies_in_neutral_regions_75kbFlanking/13Dogs/13Dogs_chr${chrNum}_callableSites_in_neutralRegions.txt
variants=/u/nobackup/kirk/phung428/tanya_data/genotype_files_for_calc_diversity/chr${chrNum}/13Dogs.GT.FORMAT
numAllele=26
out=/u/home/p/phung428/nobackup-kirk/tanya_data/R_diversity_flanking_exons/R_diversity_75kbFlanking/13Dogs/chr${chrNum}_13Dogs_diversity_75kbFlanking.txt

python compute_pairwiseDiversity.py --windows_bed ${windows} --targets_bed ${targets} --variants ${variants} --numAllele ${numAllele} --outfile ${out}
done
