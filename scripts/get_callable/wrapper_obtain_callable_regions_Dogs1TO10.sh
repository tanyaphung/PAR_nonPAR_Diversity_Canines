#!/bin/bash
#$ -cwd
#$ -V
#$ -N callableD1.10
#$ -l highp,h_data=8G,time=24:00:00
#$ -M eplau
#$ -m ea
#$ -t 1-10:5

animals=( ddair_RS74411 ddbas_RS80704 ddbdt_RS86407 ddbrt_RS86399 ddjrt_RS86400 ddjrt_RS86404 ddkbt_RS74408 ddlab_RS86398 ddpwc_RS73323 ddpwc_RS86409 )

for i in `seq 0 4`; do
task_id=$((SGE_TASK_ID+i-1))
echo $task_id
sampleabb=${animals[${task_id}]}
echo $sampleabb
inBam=/u/home/p/phung428/share_storage/share_folder/bams_for_diego/canines_bams/Dog/*_${sampleabb}_*.bam
echo $inBam
./obtain_callable_regions.sh /u/project/klohmuel/tanya_data/softwares/GenomeAnalysisTK.jar /u/home/c/cmarsden/project-klohmueldata/clares_data/canids/reference/canfam31/canfam31.fa /u/home/p/phung428/nobackup-kirk/tanya_data/callable_regions/ ${inBam} ${sampleabb}
done
