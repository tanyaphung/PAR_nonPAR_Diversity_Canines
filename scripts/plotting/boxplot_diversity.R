dogs_chrX <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity_filter/13Dogs/chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")

dogs_nonPAR <- subset(dogs_chrX, dogs_chrX[,2] > 6590000)
dogs_PAR <- subset(dogs_chrX, dogs_chrX[,2] <= 6590000)

dogs_autosomes <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity_filter/13Dogs/autosomes_diversity_divergence_removeLowCallbleLowDiversity.txt")

wolves_chrX <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity_filter/6Wolves/chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")

wolves_nonPAR <- subset(wolves_chrX, wolves_chrX[,2] > 6590000)
wolves_PAR <- subset(wolves_chrX, wolves_chrX[,2] <= 6590000)

wolves_autosomes <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity_filter/6Wolves/autosomes_diversity_divergence_removeLowCallbleLowDiversity.txt")

tiff("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/plots/021317_boxplot_nonPAR_PAR_autosomes_before_after_correction.tiff", width=7, height = 3.5, units = "in", res = 300)

par(mfrow=c(1,2), mai=c(0.5, 1, 0.5, 0.2))

boxplot(dogs_nonPAR[,5],wolves_nonPAR[,5],dogs_PAR[,5], wolves_PAR[,5], dogs_autosomes[,5], wolves_autosomes[,5], at = c(1, 2, 4, 5, 7, 8), las=1, ylab=expression(paste("Genetic diversity (", pi, ")")), xaxt="n", col=c("white", "darkgray", "white", "darkgray", "white", "darkgray"), cex=0.8)
axis(1, at = c(1.5, 4.5, 7.5), labels=c("nonPAR", "PAR", "Autosomes"), cex=0.8)
legend("topleft", legend=c("Dogs", "Wolves"), col=c("black","darkgray"), pch=c(0, 15))
mtext("A.", side=3, line=0.5, at = -1.5, cex=1.5, font=2)

dogs_nonPAR_corrected <- dogs_nonPAR[,5]/dogs_nonPAR[,6]
dogs_PAR_corrected <- dogs_PAR[,5]/dogs_PAR[,6]
dogs_autosomes_corrected <- dogs_autosomes[,5]/dogs_autosomes[,6]

wolves_nonPAR_corrected <- wolves_nonPAR[,5]/wolves_nonPAR[,6]
wolves_PAR_corrected <- wolves_PAR[,5]/wolves_PAR[,6]
wolves_autosomes_corrected <- wolves_autosomes[,5]/wolves_autosomes[,6]

boxplot(dogs_nonPAR_corrected, dogs_PAR_corrected, dogs_autosomes_corrected, wolves_nonPAR_corrected, wolves_PAR_corrected, wolves_autosomes_corrected , at = c(1, 2, 4, 5, 7, 8), las=1, ylab="", xaxt="n", col=c("white", "darkgray", "white", "darkgray", "white", "darkgray"), ylim = c(0, 5), cex=0.8)
title(ylab=expression(paste("Genetic diversity (", pi, ")")), line=1.5)
axis(1, at = c(1.5, 4.5, 7.5), labels=c("nonPAR", "PAR", "Autosomes"), cex=0.8)
legend("topleft", legend=c("Dogs", "Wolves"), col=c("black","darkgray"), pch=c(0, 15))
mtext("B.", side=3, line=0.5, at = -1.5, cex=1.5, font=2)

dev.off()

