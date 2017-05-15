#!/bin/bash
#$ -cwd
#$ -V
#$ -N Div6W_125kbFlanking
#$ -l highp,h_data=8G,time=24:00:00
#$ -M eplau
#$ -m ea

#chrX
chrNum=X

windows=/u/project/klohmuel/tanya_data/Canines_Project_Data/canFam3.1_50kb_nonoverlapping_windows/chr${chrNum}_50kb_windows.bed
targets=/u/nobackup/kirk/phung428/tanya_data/flanking_exons/callable_regions_withinSpecies_in_neutral_regions_125kbFlanking/6Wolves/6Wolves_chr${chrNum}_callableSites_in_neutralRegions.txt
variants=/u/nobackup/kirk/phung428/tanya_data/genotype_files_for_calc_diversity/chr${chrNum}/6Wolves.GT.FORMAT
numAllele=12
out=/u/home/p/phung428/nobackup-kirk/tanya_data/R_diversity_flanking_exons/R_diversity_125kbFlanking/6Wolves/chr${chrNum}_6Wolves_diversity_125kbFlanking.txt

python compute_pairwiseDiversity.py --windows_bed ${windows} --targets_bed ${targets} --variants ${variants} --numAllele ${numAllele} --outfile ${out}

for chrNum in {01..38}
do
windows=/u/project/klohmuel/tanya_data/Canines_Project_Data/canFam3.1_50kb_nonoverlapping_windows/chr${chrNum}_50kb_windows.bed
targets=/u/nobackup/kirk/phung428/tanya_data/flanking_exons/callable_regions_withinSpecies_in_neutral_regions_125kbFlanking/6Wolves/6Wolves_chr${chrNum}_callableSites_in_neutralRegions.txt
variants=/u/nobackup/kirk/phung428/tanya_data/genotype_files_for_calc_diversity/chr${chrNum}/6Wolves.GT.FORMAT
numAllele=12
out=/u/home/p/phung428/nobackup-kirk/tanya_data/R_diversity_flanking_exons/R_diversity_125kbFlanking/6Wolves/chr${chrNum}_6Wolves_diversity_125kbFlanking.txt

python compute_pairwiseDiversity.py --windows_bed ${windows} --targets_bed ${targets} --variants ${variants} --numAllele ${numAllele} --outfile ${out}
done
