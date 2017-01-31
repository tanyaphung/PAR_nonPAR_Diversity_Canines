#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

setwd(args[1])
chr = args[2]
animal = args[3]

diversity = read.csv(paste("R_per_individual_heterozygosity_PAR_project/", chr, "/", animal, "_", chr, "_per_individual_heterozygosity.txt", sep=""), header = FALSE)

divergence = read.csv(paste("R_ddbox_RKWUCLA.gjtel_RKW1332_distance/", chr, "/", chr, "_ddbox_RKWUCLA.gjtel_RKW1332_distance.txt", sep=""), header = FALSE)

diversity_divergence <- cbind(diversity[,1], diversity[,2], diversity[,3], diversity[,4], diversity[,5], divergence[,3])

#Subset based on callable sites

callable_subset <- subset(diversity_divergence, diversity_divergence[,4] > 5000)

#Compute mean

mean_diversity <- mean(diversity_divergence[,5], na.rm = TRUE)
low_diversity <- mean_diversity*0.1

#Subset based on mean

mean_callable_subset <- subset(callable_subset, callable_subset[,5] > low_diversity)

# Save output
write.table(mean_callable_subset, paste("R_filter_windows/", animal, "/", chr, "/", animal, "_", chr, "_diversity_divergence_removeLowCallbleLowDiversity.txt", sep=""), quote=FALSE, col.names = FALSE, row.names = FALSE)

