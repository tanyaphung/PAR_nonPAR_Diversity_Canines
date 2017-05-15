# human

tiff("/home/tanya/tmp/020117_temp/cotter.et.al.tiff", width=300, height = 300)
par(mfrow=c(1,1), mar=c(1, 4, 1.5, 0.7))
# uncorrected
nonPAR = 0.000602
PAR1 = 0.001505

nonPAR_PAR_ratio = nonPAR/PAR1

# correct with human-macaque

nonPAR_c = 0.012274
PAR1_c = 0.015070

nonPAR_PAR_ratio_c = nonPAR_c/PAR1_c

ratios <- c(nonPAR_PAR_ratio, nonPAR_PAR_ratio_c)
barplot(ratios, las = 1, width = 0.2, ylim = c(0, 1.1), col=c("black", "gray"), ylab="Ratio")
abline(h=0.75, col="red", lwd=2)
abline(h=1, col="red", lwd=2)
legend("top", inset=0, legend=c("Before", "After"), col=c("black","gray"), lwd=5, cex=0.7, horiz = TRUE)
dev.off()