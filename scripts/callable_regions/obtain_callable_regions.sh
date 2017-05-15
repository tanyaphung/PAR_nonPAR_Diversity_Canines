#!/bin/bash

#Usage: ./obtain_callable_regions.sh /path/to/GATK /path/to/reference path/to/outputdirectory path/to/bam samplename 

. /u/local/Modules/default/init/modules.sh
module load java/1.8.0_77
MEM=4G

GATK=$1
REF=$2
outDir=$3
inBam=$4
sampleabb=$5

java -Xmx$MEM -jar ${GATK} \
	-T CallableLoci \
	-R ${REF} \
	-I ${inBam} \
	--minDepth 10 \
	--minMappingQuality 30 \
	-summary ${outDir}/${sampleabb}/${sampleabb}'_table.txt' \
	-o ${outDir}/${sampleabb}/${sampleabb}'_callable_loci.bed'
