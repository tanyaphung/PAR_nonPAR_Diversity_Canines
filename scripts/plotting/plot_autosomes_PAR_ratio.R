tiff("/home/tanya/tmp/020117_temp/autosomes_PAR_ratio.tiff", width=480, height = 480)
par(mfrow=c(2,1), mar=c(1, 4, 1.5, 0.7))
# pre correcting for divergence

autosomes_PAR_ratio <- c(0.5517239212, 1.901717963, 0.8597699447, 0.6110750262, 0.6317765222, 0.5952700628, 0.8685346758, 0.6559384122, 1.102114518, 0.7574071375, 0.6797406256, 0.7068334889, 0.639054363, 0.6312471551, 0.5674664284, 0.5831743973, 0.6378161606, 0.6497687161, 0.9620966977, 0.8433651062)

barplot(autosomes_PAR_ratio, width = 0.5, las=1, space = 0, col=c("darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "lightblue", "lightblue", "lightblue", "lightblue", "lightblue", "lightblue", "lightcoral"), ylim=c(0, 4), main="Before correcting for Dog-Jackal divergence", ylab="Ratio", xaxs="i", yaxs="i")
abline(h=0.75, col="red", lwd=2)
abline(h=1, col="red", lwd=2)

legend("top", inset=0, legend=c("Dogs", "Grey Wolves", "Golden jackal"), col=c("darkgray","lightblue", "lightcoral"), lwd=5, cex=.7, horiz = TRUE)


# post correcting for divergence

autosomes_PAR_ratio <- c(1.005816733, 3.800004654, 1.771447806, 1.071631401, 1.151167355, 1.096659926, 1.816350728, 1.175512118, 1.534718973, 1.251540881, 1.209663938, 1.375905964, 1.105177797, 1.1495525, 1.015740135, 1.076067037, 1.127059395, 1.295895789, 1.974611083, 1.366153714)

barplot(autosomes_PAR_ratio, width = 0.5, las=1, space = 0, col=c("darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "lightblue", "lightblue", "lightblue", "lightblue", "lightblue", "lightblue", "lightcoral"), ylim=c(0, 4), main="After correcting for Dog-Jackal divergence", ylab="Ratio", xaxs="i", yaxs="i")
abline(h=0.75, col="red", lwd=2)
abline(h=1, col="red", lwd=2)

legend("top", legend=c("Dogs", "Grey Wolves", "Golden jackal"), col=c("darkgray","lightblue", "lightcoral"), lwd=5, cex=.7, horiz = TRUE)
dev.off()