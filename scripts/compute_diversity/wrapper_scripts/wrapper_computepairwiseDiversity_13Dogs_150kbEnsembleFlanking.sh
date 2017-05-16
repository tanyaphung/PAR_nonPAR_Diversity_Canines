#!/bin/bash

#chrX
chrNum=X

windows=../../../results/make_nonoverlapping_windows/50kb/chr${chrNum}_50kb_windows.bed
targets=../../../results/get_target/obtain_callable_in_neutral_for_diversity/150kb_flanking/13Dogs/13Dogs_chr${chrNum}_callableSites_in_neutralRegions.txt
variants=../../../results/compute_diversity/genotype_files_for_calc_diversity/chr${chrNum}/13Dogs.GT.FORMAT
numAllele=26
out=../../../results/compute_diversity/150kb_flanking/13Dogs/chr${chrNum}_13Dogs_diversity_150kbFlanking.txt

python compute_pairwise_diversity.py --windows_bed ${windows} --targets_bed ${targets} --variants ${variants} --numAllele ${numAllele} --outfile ${out}

for chrNum in {01..38}
do
windows=../../../results/make_nonoverlapping_windows/50kb/chr${chrNum}_50kb_windows.bed
targets=../../../results/get_target/obtain_callable_in_neutral_for_diversity/150kb_flanking/13Dogs/13Dogs_chr${chrNum}_callableSites_in_neutralRegions.txt
variants=../../../results/compute_diversity/genotype_files_for_calc_diversity/chr${chrNum}/13Dogs.GT.FORMAT
numAllele=26
out=../../../results/compute_diversity/150kb_flanking/13Dogs/chr${chrNum}_13Dogs_diversity_150kbFlanking.txt

python compute_pairwise_diversity.py --windows_bed ${windows} --targets_bed ${targets} --variants ${variants} --numAllele ${numAllele} --outfile ${out}

done
