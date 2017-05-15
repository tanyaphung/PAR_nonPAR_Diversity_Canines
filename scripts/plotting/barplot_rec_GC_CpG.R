tiff("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/plots/021517_barplot_rec_GC_CpG_nonPAR_PAR_autosomes.tiff", width=6.5, height = 3.5, units = "in", res = 300)
### recombination rate
chrX <- read.csv("/home/tanya/tmp/021417_temp/chrX_50kb_recombination_LDbased.txt", header = FALSE)

autosomes <- read.csv("/home/tanya/tmp/021417_temp/autosomes_50kb_recombination_LDbased.txt", header = FALSE)

### STEP 2: Subset nonPAR and PAR

nonPAR <- subset(chrX, chrX[,2] > 6590000)
PAR <- subset(chrX, chrX[,2] <= 6590000)

### STEP 3: Plot boxplot

boxplot(nonPAR[,3], PAR[,3], autosomes[,3])

### STEP 4: Compute mean recombination in nonPAR, PAR, and autosomes
nonPAR_rmNA <- nonPAR[,3][!is.na(nonPAR[,3])]
mean_nonPAR <- mean(nonPAR_rmNA)
sem_nonPAR <- sd(nonPAR_rmNA)/sqrt(length(nonPAR_rmNA))

PAR_rmNA <- PAR[,3][!is.na(PAR[,3])]
mean_PAR <- mean(PAR_rmNA)
sem_PAR <- sd(PAR_rmNA)/sqrt(length(PAR_rmNA))

autosomes_rmNA <- autosomes[,3][!is.na(autosomes[,3])]
mean_autosomes <- mean(autosomes_rmNA)
sem_autosomes <- sd(autosomes_rmNA)/sqrt(length(autosomes_rmNA))

mean_rec <- c(mean_nonPAR, mean_PAR, mean_autosomes)
sem_rec <- c(sem_nonPAR, sem_PAR, sem_autosomes)

### STEP 4: plot mean and 2 standard error
par(mfrow=c(1,3), mai=c(0.5, 0.6, 0.2, 0.1))

rec_bar <- barplot(mean_rec, las=1, names.arg = c("nonPAR", "PAR", "Autosomes"), ylab="", col="dodgerblue", ylim=c(0,5.5), main = "Recombination")
title(ylab="canFam3.1 recombination rate (cM/Mb) (LD-based)", line=2.5)
mtext("A.", side=3, line=-0.2, at = -1.1, cex=1.5, font=2)

segments(rec_bar, as.matrix(mean_rec) - as.matrix(sem_rec) * 2, rec_bar, as.matrix(mean_rec) + as.matrix(sem_rec)*2, lwd = 1.5)

arrows(rec_bar, as.matrix(mean_rec) - as.matrix(sem_rec) * 2, rec_bar, as.matrix(mean_rec) + as.matrix(sem_rec)*2, lwd = 1.5, angle = 90, code = 3, length = 0.05)

##### GC content
chrX_GC <- read.table("/home/tanya/tmp/021517_temp/chrX_GC.txt")
chrX_GC_rmLow <- subset(chrX_GC, chrX_GC[,4] >= 5000)

nonPAR_GC <- subset(chrX_GC_rmLow, chrX_GC_rmLow[,2] > 6590000)
PAR_GC <- subset(chrX_GC_rmLow, chrX_GC_rmLow[,2] <= 6590000)

autosomes_GC <- read.table("/home/tanya/tmp/021517_temp/autosomes_GC.txt")
autosomes_GC_rmLow <- subset(autosomes_GC, autosomes_GC[,4] >= 5000)

nonPAR_GC_rmNA <- nonPAR_GC[,5][!is.na(nonPAR_GC[,5])]
mean_nonPAR_GC_rmNA <- mean(nonPAR_GC_rmNA, na.rm=TRUE)
sem_nonPAR_GC_rmNA <- sd(nonPAR_GC_rmNA)/sqrt(length(nonPAR_GC_rmNA))

PAR_GC_rmNA <- PAR_GC[,5][!is.na(PAR_GC[,5])]
mean_PAR_GC_rmNA <- mean(PAR_GC_rmNA, na.rm=TRUE)
sem_PAR_GC_rmNA <- sd(PAR_GC_rmNA)/sqrt(length(PAR_GC_rmNA))

autosomes_GC_rmNA <- autosomes_GC_rmLow[,5][!is.na(autosomes_GC_rmLow[,5])]
mean_autosomes_GC_rmNA <- mean(autosomes_GC_rmNA, na.rm=TRUE)
sem_autosomes_GC_rmNA <- sd(autosomes_GC_rmNA)/sqrt(length(autosomes_GC_rmNA))

mean_GC <- c(mean_nonPAR_GC_rmNA, mean_PAR_GC_rmNA, mean_autosomes_GC_rmNA)
sem_GC <- c(sem_nonPAR_GC_rmNA, sem_PAR_GC_rmNA, sem_autosomes_GC_rmNA)

GC_bar <- barplot(mean_GC, las=1, names.arg = c("nonPAR", "PAR", "Autosomes"), ylab="", col="dodgerblue", ylim=c(0, 0.5), main = "GC content")
title(ylab="canFam3.1 GC content", line=2.5)
mtext("B.", side=3, line=-0.2, at = -1.15, cex=1.5, font=2)

segments(GC_bar, as.matrix(mean_GC) - as.matrix(sem_GC) * 2, GC_bar, as.matrix(mean_GC) + as.matrix(sem_GC)*2, lwd = 1.5)

arrows(GC_bar, as.matrix(mean_GC) - as.matrix(sem_GC) * 2, GC_bar, as.matrix(mean_GC) + as.matrix(sem_GC)*2, lwd = 1.5, angle = 90, code = 3, length = 0.05) 

### CpG
chrX_CpG <- read.table("/home/tanya/tmp/021517_temp/chrX_CpG.txt")
chrX_CpG_rmLow <- subset(chrX_CpG, chrX_CpG[,4] >= 5000)

nonPAR_CpG <- subset(chrX_CpG_rmLow, chrX_CpG_rmLow[,2] > 6590000)
PAR_CpG <- subset(chrX_CpG_rmLow, chrX_CpG_rmLow[,2] <= 6590000)

autosomes_CpG <- read.table("/home/tanya/tmp/021517_temp/autosomes_CpG.txt")
autosomes_CpG_rmLow <- subset(autosomes_CpG, autosomes_CpG[,4] >= 5000)

nonPAR_CpG_rmNA <- nonPAR_CpG[,5][!is.na(nonPAR_CpG[,5])]
mean_nonPAR_CpG_rmNA <- mean(nonPAR_CpG_rmNA, na.rm=TRUE)
sem_nonPAR_CpG_rmNA <- sd(nonPAR_CpG_rmNA)/sqrt(length(nonPAR_CpG_rmNA))

PAR_CpG_rmNA <- PAR_CpG[,5][!is.na(PAR_CpG[,5])]
mean_PAR_CpG_rmNA <- mean(PAR_CpG_rmNA, na.rm=TRUE)
sem_PAR_CpG_rmNA <- sd(PAR_CpG_rmNA)/sqrt(length(PAR_CpG_rmNA))

autosomes_CpG_rmNA <- autosomes_CpG_rmLow[,5][!is.na(autosomes_CpG_rmLow[,5])]
mean_autosomes_CpG_rmNA <- mean(autosomes_CpG_rmNA, na.rm=TRUE)
sem_autosomes_CpG_rmNA <- sd(autosomes_CpG_rmNA)/sqrt(length(autosomes_CpG_rmNA))

mean_CpG <- c(mean_nonPAR_CpG_rmNA, mean_PAR_CpG_rmNA, mean_autosomes_CpG_rmNA)
sem_CpG <- c(sem_nonPAR_CpG_rmNA, sem_PAR_CpG_rmNA, sem_autosomes_CpG_rmNA)

CpG_bar <- barplot(mean_CpG, las=1, names.arg = c("nonPAR", "PAR", "Autosomes"), ylab="", col="dodgerblue", ylim=c(0, 0.5), main = "CpG content")
title(ylab="canFam3.1 CpG content", line=2.5)
mtext("C.", side=3, line=-0.2, at = -1.2, cex=1.5, font=2)

segments(CpG_bar, as.matrix(mean_CpG) - as.matrix(sem_CpG) * 2, CpG_bar, as.matrix(mean_CpG) + as.matrix(sem_CpG)*2, lwd = 1.5)

arrows(CpG_bar, as.matrix(mean_CpG) - as.matrix(sem_CpG) * 2, CpG_bar, as.matrix(mean_CpG) + as.matrix(sem_CpG)*2, lwd = 1.5, angle = 90, code = 3, length = 0.05)

dev.off()


