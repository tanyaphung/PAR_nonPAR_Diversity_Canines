tiff("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/plots/021417_chrX_dogs_wolves_zoomed.tiff", width=11, height = 6, units = "in", res = 300)
dogs_chrX <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity_filter/13Dogs/chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")

par(mfrow=c(2,3), mai = c(0.6, 0.6, 0.2, 0.1))
plot(dogs_chrX[,1], dogs_chrX[,5], xlab="Genomic position", ylab = "Dogs genetic diversity", las = 1)
abline(v = 6590000, col="red", lty = 2)

dogs_chrX_subset <- subset(dogs_chrX, dogs_chrX[,2] <= 7000000)
plot(dogs_chrX_subset[,1], dogs_chrX_subset[,5], xlab="Genomic position", ylab = "Dogs genetic diversity", las = 1)
abline(v = 6590000, col="red", lty = 2)

dogs_chrX_subset <- subset(dogs_chrX, dogs_chrX[,2] <= 10000000)
plot(dogs_chrX_subset[,1], dogs_chrX_subset[,5], xlab="Genomic position", ylab = "Dogs genetic diversity", las = 1)
abline(v = 6590000, col="red", lty = 2)


wolves_chrX <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity_filter/6Wolves/chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")

plot(wolves_chrX[,1], wolves_chrX[,5], xlab="Genomic position", ylab = "Wolves genetic diversity", las=1)
abline(v = 6590000, col="red", lty = 2)

wolves_chrX_subset <- subset(wolves_chrX, wolves_chrX[,2] <= 7000000)
plot(wolves_chrX_subset[,1], wolves_chrX_subset[,5], xlab="Genomic position", ylab = "Wolves genetic diversity", las=1)
abline(v = 6590000, col="red", lty = 2)

wolves_chrX_subset <- subset(wolves_chrX, wolves_chrX[,2] <= 10000000)
plot(wolves_chrX_subset[,1], wolves_chrX_subset[,5], xlab="Genomic position", ylab = "Wolves genetic diversity", las=1)
abline(v = 6590000, col="red", lty = 2)


dev.off()
