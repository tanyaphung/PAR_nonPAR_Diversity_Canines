#!/bin/bash
#$ -cwd
#$ -V
#$ -N het_X_gwynp_RWK1547
#$ -l h_data=1G,time=2:00:00
#$ -M eplau
#$ -m ea

. /u/local/Modules/default/init/modules.sh
module load python

chrNum=X
python /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/scripts/compute_per_individual_het.py --windows_bed '/u/project/klohmuel/tanya_data/Canines_Project_Data/canFam3.1_50kb_nonoverlapping_windows/chr'${chrNum}'_50kb_windows.bed' --targets_bed '/u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions/gwynp_RWK1547/chr'${chrNum}'/gwynp_RWK1547_chr'${chrNum}'_callable_sites_in_neutral_regions.bed' --genotype_csv '/u/nobackup/kirk/phung428/tanya_data/genotype_files_for_calc_het_PAR_project/chr'${chrNum}'/gwynp_RWK1547.GT.FORMAT.csv' --outfile '/u/home/p/phung428/nobackup-kirk/tanya_data/R_per_individual_heterozygosity_PAR_project/gwynp_RWK1547/chr'${chrNum}'/gwynp_RWK1547_chr'${chrNum}_per_individual_heterozygosity.txt
