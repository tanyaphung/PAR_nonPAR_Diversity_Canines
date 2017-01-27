# PAR_nonPAR_Diversity_Canines
This repository contains scripts related to analyzing genetic diversity in the pseudoautosomal regions and non-pseudoautosmal regions of the X chromosome in canines (Phung et al.) (in preparation)

# obtain_callable_regions.sh
This script is used to obtain the regions of the genome that are callable using GATK's CallableLoci. We need to know the number of sites that are callable in order to calculate heterozygosity. 
Usage:

> ./obtain_callable_regions.sh /path/to/GenomeAnalysisTK.jar /path/to/ref.fa path/to/bam sampleName

Note that this script is intended for obtaining the callable regions for one individual.
