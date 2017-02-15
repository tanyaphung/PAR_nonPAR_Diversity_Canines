#!/bin/bash
#$ -cwd
#$ -V
#$ -N GC
#$ -l h_data=2G,time=24:00:00
#$ -M eplau
#$ -m ea

#chrX
#chrom=chrX
#windows='/u/project/klohmuel/tanya_data/Canines_Project_Data/canFam3.1_50kb_nonoverlapping_windows/'${chrom}'_50kb_windows.bed'
#targets='/u/project/klohmuel/tanya_data/PAR_Cannines_project/analyses/ensembleGenes.repeatMasker.microsat.simpleRepeats_concat/'${chrom}'/4.sort.merge.complement_'${chrom}'_ensembleGenes.repeatMasker.microsat.simpleRepeats.bed'
#out='/u/home/p/phung428/nobackup-kirk/tanya_data/R_GC/'${chrom}'_GC.txt'

#python compute_GC.py --windows_bed ${windows} --targets_bed ${targets} --chr ${chrom} --outfile ${out}

# For autosomes
for i in {01..38}
do
chrom=chr${i}
windows='/u/project/klohmuel/tanya_data/Canines_Project_Data/canFam3.1_50kb_nonoverlapping_windows/'${chrom}'_50kb_windows.bed'
targets='/u/project/klohmuel/tanya_data/PAR_Cannines_project/analyses/ensembleGenes.repeatMasker.microsat.simpleRepeats_concat/'${chrom}'/4.sort.merge.complement_'${chrom}'_ensembleGenes.repeatMasker.microsat.simpleRepeats.bed'
out='/u/home/p/phung428/nobackup-kirk/tanya_data/R_GC/'${chrom}'_GC.txt'

python compute_GC.py --windows_bed ${windows} --targets_bed ${targets} --chr ${chrom} --outfile ${out}
done
