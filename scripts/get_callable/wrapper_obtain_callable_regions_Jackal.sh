#!/bin/bash
#$ -cwd
#$ -V
#$ -N callableJ
#$ -l highp,h_data=8G,time=24:00:00
#$ -M eplau
#$ -m ea

sampleabb=gjtel_RKW1332
echo $sampleabb
inBam=/u/home/p/phung428/share_storage/share_folder/bams_for_diego/canines_bams/Jackal/*_${sampleabb}_*.bam
echo $inBam
./obtain_callable_regions.sh /u/project/klohmuel/tanya_data/softwares/GenomeAnalysisTK.jar /u/home/c/cmarsden/project-klohmueldata/clares_data/canids/reference/canfam31/canfam31.fa /u/home/p/phung428/nobackup-kirk/tanya_data/callable_regions/ ${inBam} ${sampleabb}
