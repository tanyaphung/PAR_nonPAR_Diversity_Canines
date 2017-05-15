
tiff("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/plots/021317_barplot_nonPAR_PAR_autosomes_before_after_correction.tiff", width=7, height = 3.5, units = "in", res = 300)
nonPAR_before <- c(0.0004539343, 0.0007828397)
PAR_before <- c(0.001938262, 0.002657537)
autosomes_before <- c(0.001158346, 0.001638884)

data_before <- data.frame(nonPAR_before, PAR_before, autosomes_before)

nonPAR_after <- c(0.2400412, 0.4366323)
PAR_after <- c(0.4391754, 0.6099661)
autosomes_after <- c(0.4356257, 0.6495741)

data_after <- data.frame(nonPAR_after, PAR_after, autosomes_after)

par(mfrow=c(1,2), mai=c(0.5, 1, 0.5, 0.2))
barplot(as.matrix(data_before), beside=TRUE, col=c("lightgray", "black"), las=1, names.arg = c("nonPAR", "PAR", "Autosomes"))
mtext("A.", side=3, line=0.5, at = -1.5, cex=1.5, font=2)

barplot(as.matrix(data_after), beside=TRUE, col=c("lightgray", "black"), las=1, names.arg = c("nonPAR", "PAR", "Autosomes"))
mtext("B.", side=3, line=0.5, at = -0.6, cex=1.5, font=2)
dev.off()