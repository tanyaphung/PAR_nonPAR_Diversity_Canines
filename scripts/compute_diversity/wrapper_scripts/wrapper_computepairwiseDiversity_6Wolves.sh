#!/bin/bash

#chrX
chrNum=X

windows=../../../results/make_nonoverlapping_windows/50kb/chr${chrNum}_50kb_windows.bed
targets=../../../results/get_target/compute_diversity/callable_regions_withinSpecies_in_neutral_regions/6Wolves/chr${chrNum}/6Wolves_chr${chrNum}_callableSites_in_neutralRegions.txt
variants=../../../results/compute_diversity/genotype_files_for_calc_diversity/chr${chrNum}/6Wolves.GT.FORMAT
numAllele=12
out=../../../results/compute_diversity/0kb_flanking/6Wolves/chr${chrNum}_6Wolves_diversity.txt

python compute_pairwise_diversity.py --windows_bed ${windows} --targets_bed ${targets} --variants ${variants} --numAllele ${numAllele} --outfile ${out}

for chrNum in {01..38}
do
windows=../../../results/make_nonoverlapping_windows/50kb/chr${chrNum}_50kb_windows.bed
targets=../../../results/get_target/compute_diversity/callable_regions_withinSpecies_in_neutral_regions/6Wolves/chr${chrNum}/6Wolves_chr${chrNum}_callableSites_in_neutralRegions.txt
variants=../../../results/compute_diversity/genotype_files_for_calc_diversity/chr${chrNum}/6Wolves.GT.FORMAT
numAllele=12
out=../../../results/compute_diversity/0kb_flanking/6Wolves/chr${chrNum}_6Wolves_diversity.txt

python compute_pairwise_diversity.py --windows_bed ${windows} --targets_bed ${targets} --variants ${variants} --numAllele ${numAllele} --outfile ${out}
done
