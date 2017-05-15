#!/bin/bash
#$ -cwd
#$ -V
#$ -N tabulate.geneic.sites
#$ -l highp,h_data=8G,time=24:00:00
#$ -M eplau
#$ -m ea

. /u/local/Modules/default/init/modules.sh
module load python

for i in {01..38}
do
windows=/u/project/klohmuel/tanya_data/Canines_Project_Data/canFam3.1_5kb_nonoverlapping_windows/chr${i}_5kb_windows.bed
targets=/u/project/klohmuel/tanya_data/Canines_Project_Data/ensembleGenes/canFam3.1_ensembleGenes_chr${i}_sort.bed
out=/u/home/p/phung428/tanya_data_storage/PAR_nonPAR_Diversity_Canines/analyses/tabulate_Number.Of.Genic.Sites_In.Windows/5kb/chr${i}_Number.Genic.Sites_In.Windows.txt

python tabulate_Number.Genic.Sites_In.Windows.py --windows_bed ${windows} --targets_bed ${targets} --outfile ${out}
done

i=X
windows=/u/project/klohmuel/tanya_data/Canines_Project_Data/canFam3.1_5kb_nonoverlapping_windows/chr${i}_5kb_windows.bed
targets=/u/project/klohmuel/tanya_data/Canines_Project_Data/ensembleGenes/canFam3.1_ensembleGenes_chr${i}_sort.bed
out=/u/home/p/phung428/tanya_data_storage/PAR_nonPAR_Diversity_Canines/analyses/tabulate_Number.Of.Genic.Sites_In.Windows/5kb/chr${i}_Number.Genic.Sites_In.Windows.txt

python tabulate_Number.Genic.Sites_In.Windows.py --windows_bed ${windows} --targets_bed ${targets} --outfile ${out}
