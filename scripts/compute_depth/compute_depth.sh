#!/bin/bash
#$ -cwd
#$ -V
#$ -N Depth
#$ -l highp,h_data=8G,time=24:00:00
#$ -M eplau
#$ -m ea

. /u/local/Modules/default/init/modules.sh
module load samtools

samtools depth -a /u/project/klohmuel/share_folder/bams_for_diego/canines_bams/Dog/9_libA_ddbox_RKWUCLA_nodupmaptrim.bam
