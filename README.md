# PAR_nonPAR_Diversity_Canines
This repository contains scripts related to analyzing genetic diversity in the pseudoautosomal regions and non-pseudoautosmal regions of the X chromosome in canines (Phung et al.) (in preparation)

### Variant calling with GATK

### Obtain callable loci
When computing heterozygosity, one needs to divide by the total number of callable sites in that window. In other words, when computing heterozygosity across 50kb nonoverlapping window, if all sites within that windows are callable, heterozygosity per site would be equal to number of heterozygotes divided by 50kb. However, empirical data are typically very messy and so not every site within each window would be callable. These scripts aim to obtain the regions of the genome that are callable. 

##### Use GATK to obtain callable loci from BAM file
 
Usage:

> ./obtain_callable_regions.sh /path/to/GenomeAnalysisTK.jar /path/to/ref.fa path/to/bam sampleName

Note that this script is intended for obtaining the callable regions for one individual.

After GATK Callable Loci script is done, next step is to filter the output file. Specifically, I will grep out the callable reigons for each chromosome of interest. Then, I will grep out the callable loci (regions that are annotated with CALLABLE). Finally, I will grep out col1, col2, and col3 which are the name of the chromosome, the start coordinate, and the end coordinate. 

>./format_callable_loci.sh


