tiff("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/plots/021317_barplot_nonPAR_PAR_autosomes_before_after_correction_SEM.tiff", width=7, height = 3.5, units = "in", res = 300)
### STEP 1: Load dogs and wolves data for chrX and autosomes
chrX_13Dogs <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity_filter/13Dogs/chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
autosomes_13Dogs <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity_filter/13Dogs/autosomes_diversity_divergence_removeLowCallbleLowDiversity.txt")

chrX_6Wolves <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity_filter/6Wolves/chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
autosomes_6Wolves <- read.table("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_diversity_filter/6Wolves/autosomes_diversity_divergence_removeLowCallbleLowDiversity.txt")

### STEP 2: Subset nonPAR and PAR

nonPAR_13Dogs <- subset(chrX_13Dogs, chrX_13Dogs[,2]>6590000)
PAR_13Dogs <- subset(chrX_13Dogs, chrX_13Dogs[,2]<=6590000)

nonPAR_6Wolves <- subset(chrX_6Wolves, chrX_6Wolves[,2]>6590000)
PAR_6Wolves <- subset(chrX_6Wolves, chrX_6Wolves[,2]<=6590000)

### STEP 3: BEFORE correcting for divergence, compute mean and standard error

mean_nonPAR_13Dogs <- mean(nonPAR_13Dogs[,5])
sem_nonPAR_13Dogs <- sd(nonPAR_13Dogs[,5])/sqrt(length(nonPAR_13Dogs[,5]))

mean_nonPAR_6Wolves <- mean(nonPAR_6Wolves[,5])
sem_nonPAR_6Wolves <- sd(nonPAR_6Wolves[,5])/sqrt(length(nonPAR_6Wolves[,5]))

mean_PAR_13Dogs <- mean(PAR_13Dogs[,5])
sem_PAR_13Dogs <- sd(PAR_13Dogs[,5])/sqrt(length(PAR_13Dogs[,5]))

mean_PAR_6Wolves <- mean(PAR_6Wolves[,5])
sem_PAR_6Wolves <- sd(PAR_6Wolves[,5])/sqrt(length(PAR_6Wolves[,5]))

mean_autosomes_13Dogs <- mean(autosomes_13Dogs[,5])
sem_autosomes_13Dogs <- sd(autosomes_13Dogs[,5])/sqrt(length(autosomes_13Dogs[,5]))

mean_autosomes_6Wolves <- mean(autosomes_6Wolves[,5])
sem_autosomes_6Wolves <- sd(autosomes_6Wolves[,5])/sqrt(length(autosomes_6Wolves[,5]))

mean_nonPAR_before <- c(mean_nonPAR_13Dogs, mean_nonPAR_6Wolves)
mean_PAR_before <- c(mean_PAR_13Dogs, mean_PAR_6Wolves)
mean_autosomes_before <- c(mean_autosomes_13Dogs, mean_autosomes_6Wolves)

sem_nonPAR_before <- c(sem_nonPAR_13Dogs, sem_nonPAR_6Wolves)
sem_PAR_before <- c(sem_PAR_13Dogs, sem_PAR_6Wolves)
sem_autosomes_before <- c(sem_autosomes_13Dogs, sem_autosomes_6Wolves)

mean_before <- data.frame(mean_nonPAR_before, mean_PAR_before, mean_autosomes_before)
sem_before <- data.frame(sem_nonPAR_before, sem_PAR_before, sem_autosomes_before)

### STEP 4: plot mean and 2 standard error
par(mfrow=c(1,2), mai=c(1, 1, 0.5, 0.2))
bar_before <- barplot(as.matrix(mean_before), ylim = c(0, 0.003), beside=TRUE, col=c("darkorange", "lightblue"), las=1, names.arg = c("nonPAR", "PAR", "Autosomes"), ylab="")
title(ylab=expression(paste("Genetic diversity (", pi, ")")), line=3.5)
segments(bar_before, as.matrix(mean_before) - as.matrix(sem_before) * 2, bar_before, as.matrix(mean_before) + as.matrix(sem_before)*2, lwd = 1.5)

arrows(bar_before, as.matrix(mean_before) - as.matrix(sem_before) * 2, bar_before, as.matrix(mean_before) + as.matrix(sem_before)*2, lwd = 1.5, angle = 90, code = 3, length = 0.05)
              
mtext("A.", side=3, line=0.5, at = -2.2, cex=1.5, font=2)

### STEP 5: AFTER correcting for divergence, remove Inf

nonPAR_13Dogscorrect <- nonPAR_13Dogs[,5]/nonPAR_13Dogs[,6]
nonPAR_13Dogscorrect_rmInf <- nonPAR_13Dogscorrect[!is.infinite(nonPAR_13Dogscorrect)]

nonPAR_6Wolvescorrect <- nonPAR_6Wolves[,5]/nonPAR_6Wolves[,6]
nonPAR_6Wolvescorrect_rmInf <- nonPAR_6Wolvescorrect[!is.infinite(nonPAR_6Wolvescorrect)]

PAR_13Dogscorrect <- PAR_13Dogs[,5]/PAR_13Dogs[,6]
PAR_13Dogscorrect_rmInf <- PAR_13Dogscorrect[!is.infinite(PAR_13Dogscorrect)]

PAR_6Wolvescorrect <- PAR_6Wolves[,5]/PAR_6Wolves[,6]
PAR_6Wolvescorrect_rmInf <- PAR_6Wolvescorrect[!is.infinite(PAR_6Wolvescorrect)]

autosomes_13Dogscorrect <- autosomes_13Dogs[,5]/autosomes_13Dogs[,6]
autosomes_13Dogscorrect_rmInf <- autosomes_13Dogscorrect[!is.infinite(autosomes_13Dogscorrect)]

autosomes_6Wolvescorrect <- autosomes_6Wolves[,5]/autosomes_6Wolves[,6]
autosomes_6Wolvescorrect_rmInf <- autosomes_6Wolvescorrect[!is.infinite(autosomes_6Wolvescorrect)]

mean_nonPAR_13Dogscorrect_rmInf <- mean(nonPAR_13Dogscorrect_rmInf)
sem_nonPAR_13Dogscorrect_rmInf <- sd(nonPAR_13Dogscorrect_rmInf)/sqrt(length(nonPAR_13Dogscorrect_rmInf))

mean_nonPAR_6Wolvescorrect_rmInf <- mean(nonPAR_6Wolvescorrect_rmInf)
sem_nonPAR_6Wolvescorrect_rmInf <- sd(nonPAR_6Wolvescorrect_rmInf)/sqrt(length(nonPAR_6Wolvescorrect_rmInf))

mean_PAR_13Dogscorrect_rmInf <- mean(PAR_13Dogscorrect_rmInf)
sem_PAR_13Dogscorrect_rmInf <- sd(PAR_13Dogscorrect_rmInf)/sqrt(length(PAR_13Dogscorrect_rmInf))

mean_PAR_6Wolvescorrect_rmInf <- mean(PAR_6Wolvescorrect_rmInf)
sem_PAR_6Wolvescorrect_rmInf <- sd(PAR_6Wolvescorrect_rmInf)/sqrt(length(PAR_6Wolvescorrect_rmInf))

mean_autosomes_13Dogscorrect_rmInf <- mean(autosomes_13Dogscorrect_rmInf)
sem_autosomes_13Dogscorrect_rmInf <- sd(autosomes_13Dogscorrect_rmInf)/sqrt(length(autosomes_13Dogscorrect_rmInf))

autosomes_6Wolvescorrect_rmInf_rmNA <- autosomes_6Wolvescorrect_rmInf[!is.na(autosomes_6Wolvescorrect_rmInf)]
mean_autosomes_6Wolvescorrect_rmInf <- mean(autosomes_6Wolvescorrect_rmInf_rmNA)
sem_autosomes_6Wolvescorrect_rmInf <- sd(autosomes_6Wolvescorrect_rmInf_rmNA)/sqrt(length(autosomes_6Wolvescorrect_rmInf_rmNA))

mean_nonPAR_after <- c(mean_nonPAR_13Dogscorrect_rmInf, mean_nonPAR_6Wolvescorrect_rmInf)
mean_PAR_after <- c(mean_PAR_13Dogscorrect_rmInf, mean_PAR_6Wolvescorrect_rmInf)
mean_autosomes_after <- c(mean_autosomes_13Dogscorrect_rmInf, mean_autosomes_6Wolvescorrect_rmInf)

sem_nonPAR_after <- c(sem_nonPAR_13Dogscorrect_rmInf, sem_nonPAR_6Wolvescorrect_rmInf)
sem_PAR_after <- c(sem_PAR_13Dogscorrect_rmInf, sem_PAR_6Wolvescorrect_rmInf)
sem_autosomes_after <- c(sem_autosomes_13Dogscorrect_rmInf, sem_autosomes_6Wolvescorrect_rmInf)

mean_after <- data.frame(mean_nonPAR_after, mean_PAR_after, mean_autosomes_after)
sem_after <- data.frame(sem_nonPAR_after, sem_PAR_after, sem_autosomes_after)

### STEP 4: plot mean and 2 standard error

bar_after <- barplot(as.matrix(mean_after), ylim=c(0, 0.67), beside=TRUE, col=c("darkorange", "lightblue"), las=1, names.arg = c("nonPAR", "PAR", "Autosomes"), ylab="")
title(ylab=expression(paste("Genetic diversity (", pi, ")")), line=2.3)
segments(bar_after, as.matrix(mean_after) - as.matrix(sem_after) * 2, bar_after, as.matrix(mean_after) + as.matrix(sem_after)*2, lwd = 1.5)

arrows(bar_after, as.matrix(mean_after) - as.matrix(sem_after) * 2, bar_after, as.matrix(mean_after) + as.matrix(sem_after)*2, lwd = 1.5, angle = 90, code = 3, length = 0.05)

mtext("B.", side=3, line=0.5, at = -1.3, cex=1.5, font=2)

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
dev.off()