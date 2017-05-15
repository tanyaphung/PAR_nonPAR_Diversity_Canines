tiff("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/plots/021417_barplot_cor.diversity.rec.GC.CpG_nonPAR_PAR_autosomes.tiff", width=8, height = 3.5, units = "in", res = 300)
# chrX
chrX_rec <- read.csv("/home/tanya/tmp/021417_temp/chrX_50kb_recombination_LDbased.txt", header = FALSE)
chrX_13Dogs <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity/13Dogs/chrX_13Dogs_diversity.txt")
chrX_6Wolves <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity/6Wolves/chrX_6Wolves_diversity.txt")

chrX_rec_13Dogs_6Wolves <- cbind(chrX_rec[,1], chrX_rec[,2], chrX_rec[,3], chrX_13Dogs[,5], chrX_6Wolves[,5])

chrX_rec_13Dogs_6Wolves_nonPAR <- subset(chrX_rec_13Dogs_6Wolves, chrX_rec_13Dogs_6Wolves[,2] >= 6590000)
chrX_rec_13Dogs_6Wolves_PAR <- subset(chrX_rec_13Dogs_6Wolves, chrX_rec_13Dogs_6Wolves[,2] < 6590000)

# autosomes
autosomes_rec <- read.csv("/home/tanya/tmp/021417_temp/autosomes_50kb_recombination_LDbased.txt", header = FALSE)
autosomes_13Dogs <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity/13Dogs/autosomes_13Dogs_diversity.txt")
autosomes_6Wolves <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity/6Wolves/autosomes_6Wolves_diversity.txt")

autosomes_rec_13Dogs_6Wolves <- cbind(autosomes_rec[,1], autosomes_rec[,2], autosomes_rec[,3], autosomes_13Dogs[,5], autosomes_6Wolves[,5])

cor_nonPAR <- c(cor.test(chrX_rec_13Dogs_6Wolves_nonPAR[,3], chrX_rec_13Dogs_6Wolves_nonPAR[,4], method = "spearman")$estimate, cor.test(chrX_rec_13Dogs_6Wolves_nonPAR[,3], chrX_rec_13Dogs_6Wolves_nonPAR[,5], method = "spearman")$estimate)

cor_PAR <- c(cor.test(chrX_rec_13Dogs_6Wolves_PAR[,3], chrX_rec_13Dogs_6Wolves_PAR[,4], method = "spearman")$estimate, cor.test(chrX_rec_13Dogs_6Wolves_PAR[,3], chrX_rec_13Dogs_6Wolves_PAR[,5], method = "spearman")$estimate)

cor_autosomes <- c(cor.test(autosomes_rec_13Dogs_6Wolves[,3], autosomes_rec_13Dogs_6Wolves[,4], method = "spearman")$estimate, cor.test(autosomes_rec_13Dogs_6Wolves[,3], autosomes_rec_13Dogs_6Wolves[,5], method = "spearman")$estimate)

par(mfrow=c(1,3), mai=c(0.7, 0.6, 0.2, 0.3))
all_cor <- data.frame(cor_nonPAR, cor_PAR, cor_autosomes)

barplot(as.matrix(all_cor), beside = TRUE, las = 1, col=c("darkorange", "lightblue"), names.arg = c("nonPAR", "PAR", "Autosomes"), ylab="", main = "Recombination and diversity", cex.main = 0.8, ylim=c(0, 0.6))

title(ylab=expression(paste("Spearman's ", rho, " correlation")), line=2.2)
mtext("A.", side=3, line=-0.2, at = -1.2, cex=1.5, font=2)

### GC content

chrX_GC <- read.table("/home/tanya/tmp/021517_temp/chrX_GC.txt")
chrX_13Dogs <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity/13Dogs/chrX_13Dogs_diversity.txt")
chrX_6Wolves <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity/6Wolves/chrX_6Wolves_diversity.txt")

chrX_GC_13Dogs_6Wolves <- cbind(chrX_GC[,1], chrX_GC[,2], chrX_GC[,3], chrX_13Dogs[,5], chrX_6Wolves[,5])

chrX_GC_13Dogs_6Wolves_nonPAR <- subset(chrX_GC_13Dogs_6Wolves, chrX_GC_13Dogs_6Wolves[,2] >= 6590000)
chrX_GC_13Dogs_6Wolves_PAR <- subset(chrX_GC_13Dogs_6Wolves, chrX_GC_13Dogs_6Wolves[,2] < 6590000)

# autosomes
autosomes_GC <- read.table("/home/tanya/tmp/021517_temp/autosomes_GC.txt")
autosomes_13Dogs <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity/13Dogs/autosomes_13Dogs_diversity.txt")
autosomes_6Wolves <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity/6Wolves/autosomes_6Wolves_diversity.txt")

autosomes_GC_13Dogs_6Wolves <- cbind(autosomes_GC[,1], autosomes_GC[,2], autosomes_GC[,3], autosomes_13Dogs[,5], autosomes_6Wolves[,5])

cor_nonPAR <- c(cor.test(chrX_GC_13Dogs_6Wolves_nonPAR[,3], chrX_GC_13Dogs_6Wolves_nonPAR[,4], method = "spearman")$estimate, cor.test(chrX_GC_13Dogs_6Wolves_nonPAR[,3], chrX_GC_13Dogs_6Wolves_nonPAR[,5], method = "spearman")$estimate)

cor_PAR <- c(cor.test(chrX_GC_13Dogs_6Wolves_PAR[,3], chrX_GC_13Dogs_6Wolves_PAR[,4], method = "spearman")$estimate, cor.test(chrX_GC_13Dogs_6Wolves_PAR[,3], chrX_GC_13Dogs_6Wolves_PAR[,5], method = "spearman")$estimate)

cor_autosomes <- c(cor.test(autosomes_GC_13Dogs_6Wolves[,3], autosomes_GC_13Dogs_6Wolves[,4], method = "spearman")$estimate, cor.test(autosomes_GC_13Dogs_6Wolves[,3], autosomes_GC_13Dogs_6Wolves[,5], method = "spearman")$estimate)

all_cor <- data.frame(cor_nonPAR, cor_PAR, cor_autosomes)

barplot(as.matrix(all_cor), beside = TRUE, las = 1, col=c("darkorange", "lightblue"), names.arg = c("nonPAR", "PAR", "Autosomes"), ylab="", main = "GC content and diversity", cex.main = 0.8, ylim=c(0, 0.6))

title(ylab=expression(paste("Spearman's ", rho, " correlation")), line=2.2)
mtext("B.", side=3, line=-0.2, at = -1.2, cex=1.5, font=2)

### CpG content
chrX_CpG <- read.table("/home/tanya/tmp/021517_temp/chrX_CpG.txt")
chrX_13Dogs <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity/13Dogs/chrX_13Dogs_diversity.txt")
chrX_6Wolves <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity/6Wolves/chrX_6Wolves_diversity.txt")

chrX_CpG_13Dogs_6Wolves <- cbind(chrX_CpG[,1], chrX_CpG[,2], chrX_CpG[,3], chrX_13Dogs[,5], chrX_6Wolves[,5])

chrX_CpG_13Dogs_6Wolves_nonPAR <- subset(chrX_CpG_13Dogs_6Wolves, chrX_CpG_13Dogs_6Wolves[,2] >= 6590000)
chrX_CpG_13Dogs_6Wolves_PAR <- subset(chrX_CpG_13Dogs_6Wolves, chrX_CpG_13Dogs_6Wolves[,2] < 6590000)

# autosomes
autosomes_CpG <- read.table("/home/tanya/tmp/021517_temp/autosomes_CpG.txt")
autosomes_13Dogs <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity/13Dogs/autosomes_13Dogs_diversity.txt")
autosomes_6Wolves <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity/6Wolves/autosomes_6Wolves_diversity.txt")

autosomes_CpG_13Dogs_6Wolves <- cbind(autosomes_CpG[,1], autosomes_CpG[,2], autosomes_CpG[,3], autosomes_13Dogs[,5], autosomes_6Wolves[,5])

cor_nonPAR <- c(cor.test(chrX_CpG_13Dogs_6Wolves_nonPAR[,3], chrX_CpG_13Dogs_6Wolves_nonPAR[,4], method = "spearman")$estimate, cor.test(chrX_CpG_13Dogs_6Wolves_nonPAR[,3], chrX_CpG_13Dogs_6Wolves_nonPAR[,5], method = "spearman")$estimate)

cor_PAR <- c(cor.test(chrX_CpG_13Dogs_6Wolves_PAR[,3], chrX_CpG_13Dogs_6Wolves_PAR[,4], method = "spearman")$estimate, cor.test(chrX_CpG_13Dogs_6Wolves_PAR[,3], chrX_CpG_13Dogs_6Wolves_PAR[,5], method = "spearman")$estimate)

cor_autosomes <- c(cor.test(autosomes_CpG_13Dogs_6Wolves[,3], autosomes_CpG_13Dogs_6Wolves[,4], method = "spearman")$estimate, cor.test(autosomes_CpG_13Dogs_6Wolves[,3], autosomes_CpG_13Dogs_6Wolves[,5], method = "spearman")$estimate)

all_cor <- data.frame(cor_nonPAR, cor_PAR, cor_autosomes)

barplot(as.matrix(all_cor), beside = TRUE, las = 1, col=c("darkorange", "lightblue"), names.arg = c("nonPAR", "PAR", "Autosomes"), ylab="", main = "CpG content and diversity", cex.main=0.8, ylim=c(0, 0.6))

title(ylab=expression(paste("Spearman's ", rho, " correlation")), line=2.2)


add_legend <- function(...) {
  opar <- par(fig=c(0, 1, 0, 1), oma=c(0, 0, 0, 0),
              mar=c(0.3, 0, 0, 0), new=TRUE)
  on.exit(par(opar))
  plot(0, 0, type='n', bty='n', xaxt='n', yaxt='n')
  legend(...)
}
add_legend("bottom", legend=c("Dogs", "Wolves"), pch=15,
           col=c("darkorange", "lightblue"),
           horiz=TRUE, cex=1)
mtext("C.", side=3, line=-0.2, at = -0.9, cex=1.5, font=2)

dev.off()