#!/bin/bash

#Usage: ./intersect_callableLoci_neutralRegions_for_calc_distance.sh /path/to/neutralDir /path/to/callableDir /path/to/outDir

####Note to self###
# I did: ./intersect_callableLoci_neutralRegions_for_calc_distance.sh /u/home/p/phung428/tanya_data_storage/PAR_Cannines_project/analyses/ensembleGenes.repeatMasker.microsat.simpleRepeats_concat /u/home/p/phung428/nobackup-kirk/tanya_data/callable_regions /u/home/p/phung428/nobackup-kirk/tanya_data/callable_regions_in_neutral_regions_for_calc_distance #

. /u/local/Modules/default/init/modules.sh
module load bedtools

neutralDir=$1
callableDir=$2
outDir=$3

# For chrX
chrNum=X
# first, intersect the callable sites between ddbox_RKWUCLA and gjtel_RKW1332
bedtools intersect -a ${callableDir}/'ddbox_RKWUCLA/chr'${chrNum}/'format_callable_chr'${chrNum}'_ddbox_RKWUCLA_callable_loci.bed' -b ${callableDir}/'gjtel_RKW1332/chr'${chrNum}/'format_callable_chr'${chrNum}'_gjtel_RKW1332_callable_loci.bed' > ${outDir}/'chr'${chrNum}/'ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed'

bedtools intersect -a ${neutralDir}/'chr'${chrNum}/'4.sort.merge.complement_chr'${chrNum}'_ensembleGenes.repeatMasker.microsat.simpleRepeats.bed' -b ${outDir}/'chr'${chrNum}/'ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed' > ${outDir}/'chr'${chrNum}/'ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions.bed'

# For autosomes

for chrNum in {01..38}
do

bedtools intersect -a ${callableDir}/'ddbox_RKWUCLA/chr'${chrNum}/'format_callable_chr'${chrNum}'_ddbox_RKWUCLA_callable_loci.bed' -b ${callableDir}/'gjtel_RKW1332/chr'${chrNum}/'format_callable_chr'${chrNum}'_gjtel_RKW1332_callable_loci.bed' > ${outDir}/'chr'${chrNum}/'ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed'

bedtools intersect -a ${neutralDir}/'chr'${chrNum}/'4.sort.merge.complement_chr'${chrNum}'_ensembleGenes.repeatMasker.microsat.simpleRepeats.bed' -b ${outDir}/'chr'${chrNum}/'ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed' > ${outDir}/'chr'${chrNum}/'ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions.bed'

done
