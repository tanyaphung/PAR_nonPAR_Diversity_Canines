#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

setwd(args[1])
chr = args[2]
animal = args[3]

# Load filtered file (1) start coordinate, (2) end coordinate, (3) count of heterozygotes, (4) count of callable sites, (5) ratio between heterozygotes and callable sites, (6) divergence between ddbox_RKWUCLA and gjtel_RKW1332

data <- read.table(paste("R_filter_windows/", animal, "/", chr, "/", animal, "_", chr, "_diversity_divergence_removeLowCallbleLowDiversity.txt", sep=""))

# Subset nonPAR

nonPAR <- subset(data, data[,2] > 6590000)
PAR <- subset(data, data[,2] <= 6590000)

print (animal)
print (paste("All windows: ", length(data[,1])))
print (paste("nonPAR windows: ", length(nonPAR[,1])))
print (paste("PAR windows: ", length(PAR[,1])))

print (paste("mean nonPAR diversity: ", mean(nonPAR[,5])))
print (paste("mean PAR diversity: ", mean(PAR[,5])))

nonPAR_diversity_corrected <- nonPAR[,5]/nonPAR[,6]
is.na(nonPAR_diversity_corrected) <- sapply(nonPAR_diversity_corrected, is.infinite)
print (paste("mean nonPAR diversity corrected: ", mean(nonPAR_diversity_corrected, na.rm = TRUE)))

PAR_diversity_corrected <- PAR[,5]/PAR[,6]
is.na(PAR_diversity_corrected) <- sapply(PAR_diversity_corrected, is.infinite)
print (paste("mean PAR diversity corrected: ", mean(PAR_diversity_corrected, na.rm = TRUE)))
