#!/bin/bash

## 25kb
# Autosomes
for i in {01..38}
do
totalLength=../../../../data/chrLength/chr${i}_length.bed
BED=../../../../results/get_target/ensemble_genes/ensemble_genes_0kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort.bed
python ../obtain_xkb_away_from_genes.py --total_length ${totalLength} --BED ${BED} --flanking_size 25000 --outfile ../../../../results/get_target/ensemble_genes/ensemble_genes_25kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort_25kbFlanking.bed
done

# chrX

i=X
totalLength=../../../../data/chrLength/chr${i}_length.bed
BED=../../../../results/get_target/ensemble_genes/ensemble_genes_0kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort.bed
python ../obtain_xkb_away_from_genes.py --total_length ${totalLength} --BED ${BED} --flanking_size 25000 --outfile ../../../../results/get_target/ensemble_genes/ensemble_genes_25kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort_25kbFlanking.bed

## 75kb
# Autosomes
for i in {01..38}
do
totalLength=../../../../data/chrLength/chr${i}_length.bed
BED=../../../../results/get_target/ensemble_genes/ensemble_genes_0kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort.bed
python ../obtain_xkb_away_from_genes.py --total_length ${totalLength} --BED ${BED} --flanking_size 75000 --outfile ../../../../results/get_target/ensemble_genes/ensemble_genes_75kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort_75kbFlanking.bed
done

# chrX

i=X
totalLength=../../../../data/chrLength/chr${i}_length.bed
BED=../../../../results/get_target/ensemble_genes/ensemble_genes_0kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort.bed
python ../obtain_xkb_away_from_genes.py --total_length ${totalLength} --BED ${BED} --flanking_size 75000 --outfile ../../../../results/get_target/ensemble_genes/ensemble_genes_75kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort_75kbFlanking.bed

## 125kb
# Autosomes
for i in {01..38}
do
totalLength=../../../../data/chrLength/chr${i}_length.bed
BED=../../../../results/get_target/ensemble_genes/ensemble_genes_0kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort.bed
python ../obtain_xkb_away_from_genes.py --total_length ${totalLength} --BED ${BED} --flanking_size 125000 --outfile ../../../../results/get_target/ensemble_genes/ensemble_genes_125kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort_125kbFlanking.bed
done

# chrX

i=X
totalLength=../../../../data/chrLength/chr${i}_length.bed
BED=../../../../results/get_target/ensemble_genes/ensemble_genes_0kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort.bed
python ../obtain_xkb_away_from_genes.py --total_length ${totalLength} --BED ${BED} --flanking_size 125000 --outfile ../../../../results/get_target/ensemble_genes/ensemble_genes_125kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort_125kbFlanking.bed

## 150kb
# Autosomes
for i in {01..38}
do
totalLength=../../../../data/chrLength/chr${i}_length.bed
BED=../../../../results/get_target/ensemble_genes/ensemble_genes_0kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort.bed
python ../obtain_xkb_away_from_genes.py --total_length ${totalLength} --BED ${BED} --flanking_size 150000 --outfile ../../../../results/get_target/ensemble_genes/ensemble_genes_150kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort_150kbFlanking.bed

done

# chrX

i=X
totalLength=../../../../data/chrLength/chr${i}_length.bed
BED=../../../../results/get_target/ensemble_genes/ensemble_genes_0kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort.bed
python ../obtain_xkb_away_from_genes.py --total_length ${totalLength} --BED ${BED} --flanking_size 150000 --outfile ../../../../results/get_target/ensemble_genes/ensemble_genes_150kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort_150kbFlanking.bed
