#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

setwd(args[1])
chr = args[2]
animal = args[3]

# Load filtered file (1) start coordinate, (2) end coordinate, (3) count of heterozygotes, (4) count of callable sites, (5) ratio between heterozygotes and callable sites, (6) divergence between ddbox_RKWUCLA and gjtel_RKW1332

data <- read.table(paste("R_filter_windows/", animal, "/", chr, "/", animal, "_", chr, "_diversity_divergence_removeLowCallbleLowDiversity.txt", sep=""))

print (animal)
print (paste("All windows: ", length(data[,1])))
print (paste("mean autosomes diversity: ", mean(data[,5])))

autosomes_diversity_corrected <- data[,5]/data[,6]
is.na(autosomes_diversity_corrected) <- sapply(autosomes_diversity_corrected, is.infinite)
print (paste("mean autosomes diversity corrected: ", mean(autosomes_diversity_corrected, na.rm = TRUE)))
