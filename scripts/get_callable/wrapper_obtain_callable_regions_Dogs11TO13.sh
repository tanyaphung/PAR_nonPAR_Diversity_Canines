#!/bin/bash
#$ -cwd
#$ -V
#$ -N callableD11.13
#$ -l highp,h_data=8G,time=24:00:00
#$ -M eplau
#$ -m ea

animals=( ddsct_RS86393 ddwhw_RS86397 ddbox_RKWUCLA )

for i in {0..3}
do
sampleabb=${animals[${i}]}
echo $sampleabb
inBam=/u/home/p/phung428/share_storage/share_folder/bams_for_diego/canines_bams/Dog/*_${sampleabb}_*.bam
echo $inBam
./obtain_callable_regions.sh /u/project/klohmuel/tanya_data/softwares/GenomeAnalysisTK.jar /u/home/c/cmarsden/project-klohmueldata/clares_data/canids/reference/canfam31/canfam31.fa /u/home/p/phung428/nobackup-kirk/tanya_data/callable_regions/ ${inBam} ${sampleabb}
done
