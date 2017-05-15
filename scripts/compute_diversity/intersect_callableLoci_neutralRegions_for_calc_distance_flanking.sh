#!/bin/bash

#Usage: ./intersect_callableLoci_neutralRegions_for_calc_distance_flanking.sh /path/to/neutralDir /path/to/callableDir /path/to/outDir

####Note to self###
# This script is similar to the script intersect_callableLoci_neutralRegions_for_calc_distance.sh.
# However, one difference here is that in the script intersect_callableLoci_neutralRegions_for_calc_distance.sh, I have already obtained the intersection in the callable sites between the Boxer and the Jackal. 
# Therefore, in this script, I only need to obtain the intersection between the callable sites in both the Boxer and the Jackal and the neutral regions after flanking.
# Also, this script is custom-made for this situation. To minimize mistake, I am giving absolute path here. 

. /u/local/Modules/default/init/modules.sh
module load bedtools

## 10kb Flanking
# For chrX
chrNum=X
bedtools intersect -a /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/flanking_exons/10kb/chrX/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed -b /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed > /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_10kbFlanking.bed

# For autosomes

for chrNum in {01..38}
do

bedtools intersect -a /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/flanking_exons/10kb/chr${chrNum}/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed -b /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed > /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_10kbFlanking.bed
done

## 25kb Flanking
# For chrX
chrNum=X
bedtools intersect -a /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/flanking_exons/25kb/chrX/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed -b /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed > /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_25kbFlanking.bed

# For autosomes

for chrNum in {01..38}
do

bedtools intersect -a /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/flanking_exons/25kb/chr${chrNum}/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed -b /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed > /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_25kbFlanking.bed
done

## 50kb Flanking
# For chrX
chrNum=X
bedtools intersect -a /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/flanking_exons/50kb/chrX/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed -b /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed > /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_50kbFlanking.bed

# For autosomes

for chrNum in {01..38}
do

bedtools intersect -a /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/flanking_exons/50kb/chr${chrNum}/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed -b /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed > /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_50kbFlanking.bed
done

## 75kb Flanking
# For chrX
chrNum=X
bedtools intersect -a /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/flanking_exons/75kb/chrX/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed -b /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed > /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_75kbFlanking.bed

# For autosomes

for chrNum in {01..38}
do

bedtools intersect -a /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/flanking_exons/75kb/chr${chrNum}/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed -b /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed > /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_75kbFlanking.bed
done

## 100kb Flanking
# For chrX
chrNum=X
bedtools intersect -a /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/flanking_exons/100kb/chrX/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed -b /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed > /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_100kbFlanking.bed

# For autosomes

for chrNum in {01..38}
do

bedtools intersect -a /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/flanking_exons/100kb/chr${chrNum}/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed -b /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed > /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_100kbFlanking.bed
done

## 125kb Flanking
# For chrX
chrNum=X
bedtools intersect -a /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/flanking_exons/125kb/chrX/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed -b /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed > /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_125kbFlanking.bed

# For autosomes

for chrNum in {01..38}
do

bedtools intersect -a /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/flanking_exons/125kb/chr${chrNum}/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed -b /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed > /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_125kbFlanking.bed
done

## 150kb Flanking
# For chrX
chrNum=X
bedtools intersect -a /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/flanking_exons/150kb/chrX/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed -b /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed > /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chrX/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_150kbFlanking.bed

# For autosomes

for chrNum in {01..38}
do

bedtools intersect -a /u/project/klohmuel/tanya_data/PAR_nonPAR_Diversity_Canines/analyses/flanking_exons/150kb/chr${chrNum}/4_sort_merge_complement_ensembleFlanking.repeatMasker.microSat.simpleRepeats.bed -b /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332_callable_loci.bed > /u/nobackup/kirk/phung428/tanya_data/callable_regions_in_neutral_regions_for_calc_distance/chr${chrNum}/ddbox_RKWUCLA.gjtel_RKW1332_callable_sites_in_neutral_regions_150kbFlanking.bed
done