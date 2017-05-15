#!/bin/bash

## 25kb
# Autosomes
for i in {01..38}
do
totalLength=/u/project/klohmuel/tanya_data/Canines_Project_Data/chrLength/chr${i}_length.bed
BED=/u/project/klohmuel/tanya_data/Canines_Project_Data/ensembleGenes/canFam3.1_ensembleGenes_chr${i}_sort.bed
python obtain_xkb_away_from_genes.py --total_length ${totalLength} --BED ${BED} --flanking_size 25000 --outfile /u/home/p/phung428/tanya_data_storage/Canines_Project_Data/ensembleGenes_25kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort_25kbFlanking.bed
done

# chrX

i=X
totalLength=/u/project/klohmuel/tanya_data/Canines_Project_Data/chrLength/chr${i}_length.bed
BED=/u/project/klohmuel/tanya_data/Canines_Project_Data/ensembleGenes/canFam3.1_ensembleGenes_chr${i}_sort.bed
python obtain_xkb_away_from_genes.py --total_length ${totalLength} --BED ${BED} --flanking_size 25000 --outfile /u/home/p/phung428/tanya_data_storage/Canines_Project_Data/ensembleGenes_25kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort_25kbFlanking.bed

## 75kb
# Autosomes
for i in {01..38}
do
totalLength=/u/project/klohmuel/tanya_data/Canines_Project_Data/chrLength/chr${i}_length.bed
BED=/u/project/klohmuel/tanya_data/Canines_Project_Data/ensembleGenes/canFam3.1_ensembleGenes_chr${i}_sort.bed
python obtain_xkb_away_from_genes.py --total_length ${totalLength} --BED ${BED} --flanking_size 75000 --outfile /u/home/p/phung428/tanya_data_storage/Canines_Project_Data/ensembleGenes_75kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort_75kbFlanking.bed
done

# chrX

i=X
totalLength=/u/project/klohmuel/tanya_data/Canines_Project_Data/chrLength/chr${i}_length.bed
BED=/u/project/klohmuel/tanya_data/Canines_Project_Data/ensembleGenes/canFam3.1_ensembleGenes_chr${i}_sort.bed
python obtain_xkb_away_from_genes.py --total_length ${totalLength} --BED ${BED} --flanking_size 75000 --outfile /u/home/p/phung428/tanya_data_storage/Canines_Project_Data/ensembleGenes_75kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort_75kbFlanking.bed

## 125kb
# Autosomes
for i in {01..38}
do
totalLength=/u/project/klohmuel/tanya_data/Canines_Project_Data/chrLength/chr${i}_length.bed
BED=/u/project/klohmuel/tanya_data/Canines_Project_Data/ensembleGenes/canFam3.1_ensembleGenes_chr${i}_sort.bed
python obtain_xkb_away_from_genes.py --total_length ${totalLength} --BED ${BED} --flanking_size 125000 --outfile /u/home/p/phung428/tanya_data_storage/Canines_Project_Data/ensembleGenes_125kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort_125kbFlanking.bed
done

# chrX

i=X
totalLength=/u/project/klohmuel/tanya_data/Canines_Project_Data/chrLength/chr${i}_length.bed
BED=/u/project/klohmuel/tanya_data/Canines_Project_Data/ensembleGenes/canFam3.1_ensembleGenes_chr${i}_sort.bed
python obtain_xkb_away_from_genes.py --total_length ${totalLength} --BED ${BED} --flanking_size 125000 --outfile /u/home/p/phung428/tanya_data_storage/Canines_Project_Data/ensembleGenes_125kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort_125kbFlanking.bed

## 150kb
# Autosomes
for i in {01..38}
do
totalLength=/u/project/klohmuel/tanya_data/Canines_Project_Data/chrLength/chr${i}_length.bed
BED=/u/project/klohmuel/tanya_data/Canines_Project_Data/ensembleGenes/canFam3.1_ensembleGenes_chr${i}_sort.bed
python obtain_xkb_away_from_genes.py --total_length ${totalLength} --BED ${BED} --flanking_size 150000 --outfile /u/home/p/phung428/tanya_data_storage/Canines_Project_Data/ensembleGenes_150kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort_150kbFlanking.bed
done

# chrX

i=X
totalLength=/u/project/klohmuel/tanya_data/Canines_Project_Data/chrLength/chr${i}_length.bed
BED=/u/project/klohmuel/tanya_data/Canines_Project_Data/ensembleGenes/canFam3.1_ensembleGenes_chr${i}_sort.bed
python obtain_xkb_away_from_genes.py --total_length ${totalLength} --BED ${BED} --flanking_size 150000 --outfile /u/home/p/phung428/tanya_data_storage/Canines_Project_Data/ensembleGenes_150kbFlanking/canFam3.1_ensembleGenes_chr${i}_sort_150kbFlanking.bed