#!/bin/bash
. /u/local/Modules/default/init/modules.sh
module load java/1.8.0_77

GATK="GenomeAnalysisTK.jar" # Put in the path for GATK here
ref_dir="canfam31" # Put in the path for the reference genome here
genome="canfam31.fa"
outDir="" # Put itn the path to the output directories where the outfiles will be directed to.

MEM=8G
chrNum=X

ddair_RS74411='8_ddair_RS74411_chr'${chrNum}'_UG_postBQSR.vcf'
ddbas_RS80704='8_ddbas_RS80704_chr'${chrNum}'_UG_postBQSR.vcf'
ddbdt_RS86407='8_ddbdt_RS86407_chr'${chrNum}'_UG_postBQSR.vcf'
ddbrt_RS86399='8_ddbrt_RS86399_chr'${chrNum}'_UG_postBQSR.vcf'

ddjrt_RS86400='8_ddjrt_RS86400_chr'${chrNum}'_UG_postBQSR.vcf'
ddjrt_RS86404='8_ddjrt_RS86404_chr'${chrNum}'_UG_postBQSR.vcf'
ddkbt_RS74408='8_ddkbt_RS74408_chr'${chrNum}'_UG_postBQSR.vcf'
ddlab_RS86398='8_ddlab_RS86398_chr'${chrNum}'_UG_postBQSR.vcf'

ddpwc_RS73323='8_ddpwc_RS73323_chr'${chrNum}'_UG_postBQSR.vcf'
ddpwc_RS86409='8_ddpwc_RS86409_chr'${chrNum}'_UG_postBQSR.vcf'
ddsct_RS86393='8_ddsct_RS86393_chr'${chrNum}'_UG_postBQSR.vcf'

ddwhw_RS86397='8_ddwhw_RS86397_chr'${chrNum}'_UG_postBQSR.vcf'
ddbox_RKWUCLA='8_ddbox_RKWUCLA_chr'${chrNum}'_UG_postBQSR.vcf'

gwcwx_XinXJ24='8_gwcwx_XinXJ24_chr'${chrNum}'_UG_postBQSR.vcf'
gwcwz_RKW3916='8_gwcwz_RKW3916_chr'${chrNum}'_UG_postBQSR.vcf'
gwibe_XXWIB98='8_gwibe_XXWIB98_chr'${chrNum}'_UG_postBQSR.vcf'

gwirw_RKW3073='8_gwirw_RKW3073_chr'${chrNum}'_UG_postBQSR.vcf'
gwprt_LOBO423='8_gwprt_LOBO423_chr'${chrNum}'_UG_postBQSR.vcf'
gwynp_RKW1547='8_gwynp_RKW1547_chr'${chrNum}'_UG_postBQSR.vcf'

gjtel_RKW1332='8_gjtel_RKW1332_chr'${chrNum}'_UG_postBQSR.vcf'

java -Xmx${MEM} -jar ${GATK} \
	-T CombineVariants \
	-R ${ref_dir}/${genome} \
	-V ${ddair_RS74411} \
	-V ${ddbas_RS80704} \
	-V ${ddbdt_RS86407} \
	-V ${ddbrt_RS86399} \
	-V ${ddjrt_RS86400} \
	-V ${ddjrt_RS86404} \
	-V ${ddkbt_RS74408} \
	-V ${ddlab_RS86398} \
	-V ${ddpwc_RS73323} \
	-V ${ddpwc_RS86409} \
	-V ${ddsct_RS86393} \
	-V ${ddwhw_RS86397} \
	-V ${ddbox_RKWUCLA} \
	-V ${gwcwx_XinXJ24} \
	-V ${gwcwz_RKW3916} \
	-V ${gwibe_XXWIB98} \
	-V ${gwirw_RKW3073} \
	-V ${gwprt_LOBO423} \
	-V ${gwynp_RKW1547} \
	-V ${gjtel_RKW1332} \
	-o ${outDir}/'chr'${chrNum}/'chr'${chrNum}'_merged_20canines.vcf'
