#!/bin/bash
# Usage ./gatk_single_sample.sh $saveDir $CHROM $SampleAbb $bam

GATK="GenomeAnalysisTK.jar" #Put in the path to GATK here
REF="canfam31.fa" # Put in the path to the reference genome here
MEM=4G
savedir=${1}/${2}/${3}

bamFile=${4}
CHROM=${2}
SampleAbb=${3}


. /u/local/Modules/default/init/modules.sh
module load R
module load java/1.8.0_77
############################
## Realigner target creator
############################
echo ${bamFile}
echo ${SampleAbb}

## Make a list of the 'dubious' regions where realignment may be needed
java -Xmx$MEM -jar ${GATK} \
	-I ${bamFile} \
	-L ${CHROM} \
	-R ${REF} \
	-T RealignerTargetCreator \
	-o ${savedir}/'1_RTC_'${SampleAbb}'_'${CHROM}'.list'

## Perform realginment in those regions
java -Xmx$MEM -jar ${GATK} \
	-I ${bamFile} \
	-L ${CHROM} \
	-R ${REF} \
	-T IndelRealigner \
	-targetIntervals ${savedir}/'1_RTC_'${SampleAbb}'_'${CHROM}'.list' \
	-o ${savedir}/'2_Realigned_'${SampleAbb}'_'${CHROM}'.bam'

#######
## BSQR
#######
## Run base quality score recalibration. 

## Call SNPs with Unified Genotyper because you need known snp sites to do the BQSR
java -Xmx$MEM -jar ${GATK} \
	-glm SNP \
	-T UnifiedGenotyper \
	-R ${REF} \
	-L ${CHROM} \
	-l INFO \
	--genotyping_mode DISCOVERY \
	--min_base_quality_score 20 \
	-metrics ${savedir}/${SampleAbb}'_'${CHROM}'_metrics.txt' \
	-I ${savedir}/'2_Realigned_'${SampleAbb}'_'${CHROM}'.bam' \
	-o ${savedir}/'3_UG_'${SampleAbb}'_'${CHROM}'.vcf'

#  Step 1: BaseRecalibrator: Produce the recalibration table with BaseRecalibrator
java -Xmx$MEM -jar ${GATK} \
	-T BaseRecalibrator \
	-R ${REF} \
	-L ${CHROM} \
	-knownSites ${savedir}/'3_UG_'${SampleAbb}'_'${CHROM}'.vcf' \
	-I ${savedir}/'2_Realigned_'${SampleAbb}'_'${CHROM}'.bam' \
	-o ${savedir}/'4_'${SampleAbb}'_'${CHROM}'_pre_recal.table'

# Step 2: BaseRecalibrator on recalibrated files
java -Xmx$MEM -jar ${GATK} \
	-T BaseRecalibrator \
	--intervals ${CHROM} \
	-R ${REF} \
	-L ${CHROM} \
	-knownSites ${savedir}/'3_UG_'${SampleAbb}'_'${CHROM}'.vcf' \
	-I ${savedir}/'2_Realigned_'${SampleAbb}'_'${CHROM}'.bam' \
	-BQSR ${savedir}/'4_'${SampleAbb}'_'${CHROM}'_pre_recal.table' \
	-o ${savedir}/'5_'${SampleAbb}'_'${CHROM}'_post_recal.table' \

# Step 3: AnalyzeCovariates and make plots of before and after to see if recal worked.
java -Xmx$MEM -jar ${GATK} \
	-T AnalyzeCovariates \
	-L ${CHROM} \
	-R ${REF} \
	-before ${savedir}/'4_'${SampleAbb}'_'${CHROM}'_pre_recal.table' \
	-after ${savedir}/'5_'${SampleAbb}'_'${CHROM}'_post_recal.table' \
	-plots ${savedir}/'6_'${SampleAbb}'_'${CHROM}'_recalibration_PLOTS.pdf'

# Step 4: Apply recal to original bam file with print reads
java -Xmx$MEM -jar ${GATK} \
	-T PrintReads \
	-L ${CHROM} \
	-R ${REF} \
	-I ${savedir}/'2_Realigned_'${SampleAbb}'_'${CHROM}'.bam' \
	-BQSR ${savedir}/'5_'${SampleAbb}'_'${CHROM}'_post_recal.table' \
	-o ${savedir}/'7_'${SampleAbb}'_'${CHROM}'_BQSR_recalibrated.bam'

############################
## Genotype calling
############################
### Run unified genotyper on the recalibrated bam

java -Xmx$MEM -jar ${GATK} \
	-R ${REF} \
	-L ${CHROM} \
	-T UnifiedGenotyper \
	--min_base_quality_score 30 \
	-I ${savedir}/'7_'${SampleAbb}'_'${CHROM}'_BQSR_recalibrated.bam' \
	-o ${savedir}/'8_'${SampleAbb}'_'${CHROM}'_UG_postBQSR.vcf' \
	--output_mode EMIT_ALL_SITES



