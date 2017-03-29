# PAR_nonPAR_Diversity_Canines
This repository contains scripts related to analyzing genetic diversity in the pseudoautosomal regions and non-pseudoautosmal regions of the X chromosome in canines (Phung et al.) (in preparation)

### GATK Variant Calling

* Start out with BAM files that have been aligned (BAM files were obtained from Marsden et al. 2016). Here I will describe how I obtain the VCF files from these BAM files

##### Step 1: Single sample variant calling with GATK
```
./gatk_single_sample.sh
```
##### Step 2: Merge all of the VCFs from 20 individuals to one VCF
```
./merge_vcfs.sh
```
##### Filter variants: GATK hard filter, remove nonbiallelic variants and clustered SNPs
```
./filter_vcfs.sh
```
##### Obtain GT for each individual
```
./obtain_GT_for_1_ind_from_VCF.sh
```

### Obtain callable loci
When computing heterozygosity, one needs to divide by the total number of callable sites in that window. In other words, when computing heterozygosity across 50kb nonoverlapping window, if all sites within that windows are callable, heterozygosity per site would be equal to number of heterozygotes divided by 50kb. However, empirical data are typically very messy and so not every site within each window would be callable. These scripts aim to obtain the regions of the genome that are callable. 

##### Use GATK to obtain callable loci from BAM file
 
Usage:

```
./obtain_callable_regions.sh /path/to/GenomeAnalysisTK.jar /path/to/ref.fa path/to/bam sampleName
```
Note that this script is intended for obtaining the callable regions for one individual.

After GATK Callable Loci script is done, next step is to filter the output file. Specifically, I will grep out the callable reigons for each chromosome of interest. Then, I will grep out the callable loci (regions that are annotated with CALLABLE). Finally, I will grep out col1, col2, and col3 which are the name of the chromosome, the start coordinate, and the end coordinate. 
```
./format_callable_loci.sh
```

### Compute pairwise genetic diversity
#### Obtain callable sites for each species

* Previously when I computed per individual heterozygosity, because it is for each individual, the callable sites are for that particular individuals. 
* Now in order to compute genetic diversity within 13 dogs and 6 wolves, I need to obtain callable sites within 13 dogs and 6 wolves. 
* Used bedtools intersect for this. Currently I used bedtools intersect on 2 files, then pipe the output to be intersect with another file. This is extremely inefficient but there are currenly no tools to do this more efficiently that I can find. 
```
./intersect_callableRegions_13Dogs.sh
```

```
./intersect_callableRegions_6Wolves.sh
```
#### Obtain callable sites that are neutral for each species
```
./intersect_callableRegionsWithinSpecies_neutralRegions.sh
```
#### Obtain variant sites for each species

* Use VCFtools to subset 13 dog individuals and 6 wolf individuals from the filtered VCF
```
./obtain_GT_for_13dogs_from_VCF.sh /path/to/input/directory /path/to/output/directory
```
#### Compute pairwise diversity

* All scripts associated with computing pairwise diversity can be found in computePi

* The main function is compute_pairwiseDiversity.py. For usage:
```
python compute_pairwiseDiversity.py -h
usage: compute_pairwiseDiversity.py [-h] --windows_bed WINDOWS_BED
                                    --targets_bed TARGETS_BED --variants
                                    VARIANTS --numAllele NUMALLELE --outfile
                                    OUTFILE

This script computes pairwise diversity.

optional arguments:
  -h, --help            show this help message and exit
  --windows_bed WINDOWS_BED
                        REQUIRED. BED file for Xkb window.
  --targets_bed TARGETS_BED
                        REQUIRED. BED file specifying the regions to be
                        partitioned into Xkb window. For example, give the
                        path for the bed file where regions represent neutral
                        region
  --variants VARIANTS   REQUIRED. Variant file. The format should be CHROM POS
                        ind1 ind2 etc. Should be tab delimit. Because of VCF
                        format, it is 1-based
  --numAllele NUMALLELE
                        REQUIRED. Indicate the number of alleles, which is
                        equal to the number of individuals in your sample
                        times 2.
  --outfile OUTFILE     REQUIRED. Name of output file.

```
