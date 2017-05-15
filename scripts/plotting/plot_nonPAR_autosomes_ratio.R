tiff("/home/tanya/tmp/020117_temp/nonPAR_autosomes_ratio.tiff", width=480, height = 480)
par(mfrow=c(2,1), mar=c(1, 4, 1.5, 0.7))
# pre correcting for divergence

nonPAR_autosomes_ratio <- c(0.3053751361, 0.2041680273, 0.3767150489, 0.3514792859, 0.4134621018, 0.4110446688, 0.267646756, 0.4012612517, 0.2692610427, 0.4289985494, 0.3430944531, 0.3449805381, 0.4428094526, 0.4854809966, 0.1948135601, 0.3404673273, 0.4580020109, 0.4004038635, 0.2334302529, 0.3139987403)

barplot(nonPAR_autosomes_ratio, width = 0.5, las=1, space = 0, col=c("darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "lightblue", "lightblue", "lightblue", "lightblue", "lightblue", "lightblue", "lightcoral"), ylim=c(0, 1.2), main="Before correcting for Dog-Jackal divergence", ylab="Ratio", xaxs="i", yaxs="i")
abline(h=0.75, col="red", lwd=2)
abline(h=1, col="red", lwd=2)

legend("top", inset=0, legend=c("Dogs", "Grey Wolves", "Golden jackal"), col=c("darkgray","lightblue", "lightcoral"), lwd=5, cex=.7, horiz = TRUE)


# post correcting for divergence

nonPAR_autosomes_ratio <- c(0.3873862478, 0.263921965, 0.528531002, 0.4927169546, 0.5818386077, 0.5816162658, 0.3615126387, 0.5326271544, 0.3987659789, 0.5962864037, 0.460677268, 0.4885997779, 0.6309325288, 0.6897819629, 0.2681709557, 0.4795318961, 0.6460117035, 0.6090910748, 0.272833092, 0.43625162)

barplot(nonPAR_autosomes_ratio, width = 0.5, las=1, space = 0, col=c("darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "darkgray", "lightblue", "lightblue", "lightblue", "lightblue", "lightblue", "lightblue", "lightcoral"), ylim=c(0, 1.2), main="After correcting for Dog-Jackal divergence", ylab="Ratio", xaxs="i", yaxs="i")
abline(h=0.75, col="red", lwd=2)
abline(h=1, col="red", lwd=2)

legend("top", legend=c("Dogs", "Grey Wolves", "Golden jackal"), col=c("darkgray","lightblue", "lightcoral"), lwd=5, cex=.7, horiz = TRUE)
dev.off()