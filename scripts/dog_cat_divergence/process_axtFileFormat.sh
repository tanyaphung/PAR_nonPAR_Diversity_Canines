#!/bin/bash
workingDir=../../analyses/dog_cat_divergence/download
axtFile='canFam3.felCat8.net.axt'

# STEP 1: Remove #
grep -v "#" ${workingDir}/${axtFile} > ${workingDir}/${axtFile}_rmHeader

# STEP 2; separate summary line from sequence line for species 1 and sequence line for species 2

sed -n '1~4p' ${workingDir}/${axtFile}_rmHeader > ${workingDir}/${axtFile}_rmHeader_summary_line
sed -n '2~4p' ${workingDir}/${axtFile}_rmHeader > ${workingDir}/${axtFile}_rmHeader_canFam3_sequence
sed -n '3~4p' ${workingDir}/${axtFile}_rmHeader > ${workingDir}/${axtFile}_rmHeader_felCat8_sequence

# STEP 3: separate the summary line into separate files for each chromosome

for i in {1..38}
do
awk -v pat="chr${i}" '$2==pat {print}' ${workingDir}/${axtFile}_rmHeader_summary_line > ${workingDir}/${axtFile}_rmHeader_summary_line_chr${i}
done

awk '$2=="chrX"{print}' ${workingDir}/${axtFile}_rmHeader_summary_line > ${workingDir}/${axtFile}_rmHeader_summary_line_chrX
