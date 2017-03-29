#!/bin/bash
. /u/local/Modules/default/init/modules.sh
module load java/1.8.0_77

GATK='GenomeAnalysisTK.jar' # Put in the path for GATK here
REF='canfam31.fa' # Put in the path for the reference genome here
inDir='' # Put in the directory where to find the input files
outDir='' # Put in the directory where to find the output files

chrNum=X

MEM=4G

############################################
### Select variants by excluding nonvariants
############################################


java -Xmx$MEM -jar ${GATK} \
        -R ${REF} \
	-T SelectVariants \
	--excludeNonVariants \
	-V ${inDir}/'chr'${chrNum}/'chr'${chrNum}'_merged_20canines.vcf' \
	-o ${outDir}/'chr'${chrNum}/'1_SV_chr'${chrNum}'_merged_20canines.vcf'

###############
### Hard filter
###############

java -Xmx$MEM -jar ${GATK} \
        -R ${REF} \
        -T VariantFiltration \
        -V ${outDir}/'chr'${chrNum}/'1_SV_chr'${chrNum}'_merged_20canines.vcf' \
        -filter "QD < 2.0" -filterName "lowQD" \
	-filter "FS > 60.0" -filterName "highFS" \
	-filter "MQ < 40.0" -filterName "lowMQ" \
	-filter "MQRankSum < -12.5" -filterName "lowMQRankSum" \
	-filter "ReadPosRankSum < -8.0" -filterName "lowReadPosRankSum" \
        -o ${outDir}/'chr'${chrNum}/'2_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf'

###################################################################################################
###### Select variants
###### The goal of this intermediate file is to quickly check whether GATK is doing the right thing
###################################################################################################

java -Xmx$MEM -jar ${GATK} \
        -R ${REF} \
        -T SelectVariants \
        -V ${outDir}/'chr'${chrNum}/'2_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf' \
        -ef \
        -o ${outDir}/'chr'${chrNum}/'3_SV_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf'


###################################################
###### Select variants
###### Select biallelic SNP
###### Only retain sites that are annotated as PASS
###################################################

java -Xmx$MEM -jar ${GATK} \
        -R ${REF} \
        -T SelectVariants \
        -V ${outDir}/'chr'${chrNum}/'3_SV_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf' \
        -selectType SNP \
        --restrictAllelesTo BIALLELIC \
        -o ${outDir}/'chr'${chrNum}/'4_BiSNP_SV_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf'


##################################################
###### Remove clustered SNPs (> 3SNPs within 10bp)
##################################################

java -Xmx$MEM -jar ${GATK} \
        -R ${REF} \
        -T VariantFiltration \
        -V ${outDir}/'chr'${chrNum}/'4_BiSNP_SV_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf' \
        --clusterWindowSize 10 --clusterSize 3 \
        -o ${outDir}/'chr'${chrNum}/'5_rmClusterSNP_BiSNP_SV_chr'${chrNum}'_merged_20canines.vcf'

########################
###### Retain PASS sites
########################

java -Xmx$MEM -jar ${GATK} \
        -R ${REF} \
        -T SelectVariants \
        -V ${outDir}/'chr'${chrNum}/'5_rmClusterSNP_BiSNP_SV_chr'${chrNum}'_merged_20canines.vcf' \
        -ef \
        -o ${outDir}/'chr'${chrNum}/'6_SV_rmClusterSNP_BiSNP_SV_GATKHardFilter_SV_chr'${chrNum}'_merged_20canines.vcf'
