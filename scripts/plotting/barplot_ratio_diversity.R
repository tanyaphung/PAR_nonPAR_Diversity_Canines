tiff("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/plots/021317_barplot_nonPAR_PAR_autosomes_before_after_correction_ratio.tiff", width=7, height = 3.5, units = "in", res = 300)
# bar plot ratios
nonPAR_before <- c(0.2341965637, 0.2945733963)
PAR_before <- c(0.3918814413, 0.4776663266)
autosomes_before <- c(0.5976209615, 0.616692825)

data_before <- data.frame(nonPAR_before, PAR_before, autosomes_before)

nonPAR_after <- c(0.5465725084, 0.7158304371)
PAR_after <- c(0.5510262595, 0.6721824346)
autosomes_after <- c(0.9919173524, 1.064934756)

data_after <- data.frame(nonPAR_after, PAR_after, autosomes_after)

par(mfrow=c(1,2), mai=c(1, 1, 0.5, 0.2))
par(xpd=FALSE)
barplot(as.matrix(data_before), beside=TRUE, col=c("darkorange", "lightblue"), las=1, names.arg = c("nonPAR/PAR", "PAR/A", "A/PAR"), ylim=c(0, 1.1), ylab="Ratio", cex.names = 0.8)
abline(h = 0.75, col="blue", lwd=2)
abline(h = 1, col="red", lwd=2)
mtext("A.", side=3, line=0.5, at = -1.7, cex=1.5, font=2)

barplot(as.matrix(data_after), beside=TRUE, col=c("darkorange", "lightblue"), las=1, names.arg = c("nonPAR/PAR", "PAR/A", "A/PAR"), ylim=c(0, 1.1), ylab="Ratio", cex.names=0.8)
abline(h = 0.75, col="blue", lwd=2)
abline(h = 1, col="red", lwd=2)

mtext("B.", side=3, line=0.5, at = -1.7, cex=1.5, font=2)

# par(xpd=TRUE)
# legend(-3.5,-0.3, legend=c("Dogs", "Wolves"), col=c("darkorange","lightblue"), pch=15, horiz = TRUE, bty="n")

# legend("bottom", legend=c("Dogs", "Wolves"), col=c("darkorange","lightblue"), pch=15, horiz = TRUE, bty="n", inset=c(3,0))

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