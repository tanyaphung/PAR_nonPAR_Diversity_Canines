tiff("/home/tanya/tmp/020117_temp/nonPAR_PAR_ratio.tiff", width=480, height = 480)
par(mfrow=c(2,1), mar=c(1, 4, 1.5, 0.7))
# pre correcting for divergence

nonPAR_PAR_ratio <- c(0.1684827675, 0.388270005, 0.3238882767, 0.2147802138, 0.2612156487, 0.2446825858, 0.2324604884, 0.2632026683, 0.2967565043, 0.3249265633, 0.2332152382, 0.2438437973, 0.2829793127, 0.306458498, 0.1105501551, 0.1985518284, 0.2921210841, 0.2601699043, 0.2245824754, 0.264815581)

barplot(nonPAR_PAR_ratio, width = 0.5, las=1, space = 0, col=c("darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "lightblue", "lightblue", "lightblue", "lightblue", "lightblue", "lightblue", "lightcoral"), ylim=c(0, 1.2), main="Before correcting for Dog-Jackal divergence", ylab="Ratio", xaxs="i", yaxs="i")
abline(h=0.75, col="red", lwd=2)
abline(h=1, col="red", lwd=2)

legend("top", inset=0, legend=c("Dogs", "Grey Wolves", "Golden jackal"), col=c("darkgray","lightblue", "lightcoral"), lwd=5, cex=.7, horiz = TRUE)


# post correcting for divergence

nonPAR_PAR_ratio <- c(0.38963957, 1.002904695, 0.9362650836, 0.5280109604, 0.6697936108, 0.6378352511, 0.6566337445, 0.6261096744, 0.6119937134, 0.7462768111, 0.5572646781, 0.6722673486, 0.6972926223, 0.7929405802, 0.2723920027, 0.5160084667, 0.7280935596, 0.7893185591, 0.5387392472, 0.5959867709)

barplot(nonPAR_PAR_ratio, width = 0.5, las=1, space = 0, col=c("darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "lightblue", "lightblue", "lightblue", "lightblue", "lightblue", "lightblue", "lightcoral"), ylim=c(0, 1.2), main="After correcting for Dog-Jackal divergence", ylab="Ratio", xaxs="i", yaxs="i")
abline(h=0.75, col="red", lwd=2)
abline(h=1, col="red", lwd=2)

legend("top", legend=c("Dogs", "Grey Wolves", "Golden jackal"), col=c("darkgray","lightblue", "lightcoral"), lwd=5, cex=.7, horiz = TRUE)
dev.off()