#!/bin/bash
#$ -cwd
#$ -V
#$ -N callableW
#$ -l highp,h_data=8G,time=24:00:00
#$ -M eplau
#$ -m ea
#$ -t 1-6:3

animals=( gwcwx_XinXJ24 gwcwz_RKW3916 gwibe_XXWIB98 gwirw_RKW3073 gwprt_LOBO423 gwynp_RKW1547 )

for i in `seq 0 2`; do
task_id=$((SGE_TASK_ID+i-1))
echo $task_id
sampleabb=${animals[${task_id}]}
echo $sampleabb
inBam=/u/home/p/phung428/share_storage/share_folder/bams_for_diego/canines_bams/GreyWolf/*_${sampleabb}_*.bam
echo $inBam
./obtain_callable_regions.sh /u/project/klohmuel/tanya_data/softwares/GenomeAnalysisTK.jar /u/home/c/cmarsden/project-klohmueldata/clares_data/canids/reference/canfam31/canfam31.fa /u/home/p/phung428/nobackup-kirk/tanya_data/callable_regions/ ${inBam} ${sampleabb}
done
