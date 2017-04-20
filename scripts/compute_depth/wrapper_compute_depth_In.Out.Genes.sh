#!/bin/bash
#$ -cwd
#$ -V
#$ -N Avg.depth.X
#$ -l highp,h_data=16G,time=24:00:00
#$ -M eplau
#$ -m ea

. /u/local/Modules/default/init/modules.sh
module load python

python compute_depth_In.Out.Genes.py --BED ~/tanya_data_storage/Canines_Project_Data/ensembleGenes/canFam3.1_ensembleGenes_chrX_sort.bed --depth chrX_boxer_depth.txt --outfile canFam3.1_ensembleGenes_chrX_sort_depth.bed
