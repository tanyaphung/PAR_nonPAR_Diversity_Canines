chrX_divergence <- read.csv("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_ddbox_RKWUCLA.gjtel_RKW1332_distance/chrX_ddbox_RKWUCLA.gjtel_RKW1332_distance.txt", header=FALSE)
autosomes_divergence <- read.csv("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_ddbox_RKWUCLA.gjtel_RKW1332_distance/autosomes_ddbox_RKWUCLA.gjtel_RKW1332_distance.txt", header=FALSE)

nonPAR_divergence <- subset(chrX_divergence, chrX_divergence[,2] > 6590000)
PAR_divergence <- subset(chrX_divergence, chrX_divergence[,2] <= 6590000)

nonPAR_divergence_rmNA <- nonPAR_divergence[,3][!is.na(nonPAR_divergence[,3])]
PAR_divergence_rmNA <- PAR_divergence[,3][!is.na(PAR_divergence[,3])]
autosomes_divergence_rmNA <- autosomes_divergence[,3][!is.na(autosomes_divergence[,3])]

mean_nonPAR_divergence_rmNA <- mean(nonPAR_divergence_rmNA)
mean_PAR_divergence_rmNA <- mean(PAR_divergence_rmNA)
mean_autosomes_divergence_rmNA <- mean(autosomes_divergence_rmNA)

sem_nonPAR_divergence_rmNA <- sd(nonPAR_divergence_rmNA)/sqrt(length(nonPAR_divergence_rmNA))
sem_PAR_divergence_rmNA <- sd(PAR_divergence_rmNA)/sqrt(length(PAR_divergence_rmNA))
sem_autosomes_divergence_rmNA <- sd(autosomes_divergence_rmNA)/sqrt(length(autosomes_divergence_rmNA))

mean_divergence <- c(mean_nonPAR_divergence_rmNA, mean_PAR_divergence_rmNA, mean_autosomes_divergence_rmNA)
sem_divergence <- c(sem_nonPAR_divergence_rmNA, sem_PAR_divergence_rmNA, sem_autosomes_divergence_rmNA)

par(mfrow=c(1,2), mai=c(0.5, 1, 0.3, 0.2))
bar <- barplot(as.matrix(mean_divergence), col="dodgerblue", las=1, names.arg = c("nonPAR", "PAR", "Autosomes"), ylab="", ylim = c(0, 0.0055), beside = TRUE)
title(ylab="Dog-jackal divergence", line=3.2)
segments(bar, as.matrix(mean_divergence) - as.matrix(sem_divergence) * 2, bar, as.matrix(mean_divergence) + as.matrix(sem_divergence)*2, lwd = 1.5)

arrows(bar, as.matrix(mean_divergence) - as.matrix(sem_divergence) * 2, bar, as.matrix(mean_divergence) + as.matrix(sem_divergence)*2, lwd = 1.5, angle = 90, code = 3, length = 0.05)

nonPAR_PAR <- mean_nonPAR_divergence_rmNA/mean_PAR_divergence_rmNA
nonPAR_autosomes <- mean_nonPAR_divergence_rmNA/mean_autosomes_divergence_rmNA
autosomes_PAR <- mean_autosomes_divergence_rmNA/mean_PAR_divergence_rmNA
ratio <- c(nonPAR_PAR, nonPAR_autosomes, autosomes_PAR)
barplot(as.matrix(ratio), col=c("dodgerblue", "dodgerblue", "dodgerblue"), las = 1, names.arg = c("nonPAR/PAR", "nonPAR/A", "A/PAR"), ylab = "Ratio", ylim=c(0,1), beside = TRUE)
