#!/bin/bash

while [[ $# -gt 0 ]]
do
opt="$1"

case $opt in
  -h|--help)
  echo "This script is used to obtain the callable regions from a bam file using GATK. To run this, inputs are 1. Path to GATK, 2. Path to the reference genome, 3. Path to the output directory, 4. Path to the bam file, 5. Name of the individual. Note that input should be in this order."
  shift
  ;;
  *)
  ;;
esac
done

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
