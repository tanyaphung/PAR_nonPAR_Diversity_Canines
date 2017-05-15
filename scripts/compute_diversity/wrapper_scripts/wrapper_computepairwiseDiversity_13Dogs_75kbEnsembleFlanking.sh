#!/bin/bash

#chrX
chrNum=X

windows=../../../results/make_nonoverlapping_windows/50kb/chr${chrNum}_50kb_windows.bed
targets=../../../results/get_target/compute_diversity/flanking_exons/callable_regions_withinSpecies_in_neutral_regions_75kbFlanking/13Dogs/chr${chrNum}/13Dogs_chr${chrNum}_callableSites_in_neutralRegions.txt
variants=../../../results/compute_diversity/genotype_files_for_calc_diversity/chr${chrNum}/13Dogs.GT.FORMAT
numAllele=26
out=../../../results/compute_diversity/75kb_flanking/13Dogs/chr${chrNum}_13Dogs_diversity_75kbFlanking.txt

python compute_pairwise_diversity.py --windows_bed ${windows} --targets_bed ${targets} --variants ${variants} --numAllele ${numAllele} --outfile ${out}

for chrNum in {01..38}
do
windows=../../../results/make_nonoverlapping_windows/50kb/chr${chrNum}_50kb_windows.bed
targets=../../../results/get_target/compute_diversity/flanking_exons/callable_regions_withinSpecies_in_neutral_regions_75kbFlanking/13Dogs/chr${chrNum}/13Dogs_chr${chrNum}_callableSites_in_neutralRegions.txt
variants=../../../results/compute_diversity/genotype_files_for_calc_diversity/chr${chrNum}/13Dogs.GT.FORMAT
numAllele=26
out=../../../results/compute_diversity/75kb_flanking/13Dogs/chr${chrNum}_13Dogs_diversity_75kbFlanking.txt

python compute_pairwise_diversity.py --windows_bed ${windows} --targets_bed ${targets} --variants ${variants} --numAllele ${numAllele} --outfile ${out}

done
