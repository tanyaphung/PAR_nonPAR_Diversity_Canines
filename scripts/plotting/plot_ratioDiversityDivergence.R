setwd("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_filter_windows/")
ddbox_RKWUCLA <- read.table("ddbox_RKWUCLA/chrX/ddbox_RKWUCLA_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")

diversity_corrected <- ddbox_RKWUCLA[,5]/ddbox_RKWUCLA[,6]
is.na(diversity_corrected) <- sapply(diversity_corrected, is.infinite)
diversity <- diversity_corrected/mean(diversity_corrected, na.rm=TRUE)
divergence <- ddbox_RKWUCLA[,6]/mean(ddbox_RKWUCLA[,6])
par(mfrow=c(1,1), mar=c(5, 5, 2, 1))
plot(ddbox_RKWUCLA[,1], diversity, las = 1, ylab="Ratio between diversity (black) or divergence (blue) to mean", xlab="ChrX position", pch=0, main="ddbox_RKWUCLA")
points(ddbox_RKWUCLA[,1], divergence, col="blue", pch=16)
legend("topright", legend=c("Diversity", "Divergence"), col=c("black","blue"), pch=c(0,16))

ddbrt_RS86399 <- read.table("ddbrt_RS86399/chrX/ddbrt_RS86399_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")

diversity_corrected <- ddbrt_RS86399[,5]/ddbrt_RS86399[,6]
is.na(diversity_corrected) <- sapply(diversity_corrected, is.infinite)
diversity <- diversity_corrected/mean(diversity_corrected, na.rm=TRUE)
divergence <- ddbrt_RS86399[,6]/mean(ddbrt_RS86399[,6])
par(mfrow=c(1,1), mar=c(5, 5, 2, 1))
plot(ddbrt_RS86399[,1], diversity, las = 1, ylab="Ratio between diversity (black) or divergence (blue) to mean", xlab="ChrX position", pch=0, main="ddbrt_RS86399")
points(ddbrt_RS86399[,1], divergence, col="blue", pch=16)
legend("topright", legend=c("Diversity", "Divergence"), col=c("black","blue"), pch=c(0,16))

ddjrt_RS86400 <- read.table("ddjrt_RS86400/chrX/ddjrt_RS86400_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")

diversity_corrected <- ddjrt_RS86400[,5]/ddjrt_RS86400[,6]
is.na(diversity_corrected) <- sapply(diversity_corrected, is.infinite)
diversity <- diversity_corrected/mean(diversity_corrected, na.rm=TRUE)
divergence <- ddjrt_RS86400[,6]/mean(ddjrt_RS86400[,6])
par(mfrow=c(1,1), mar=c(5, 5, 2, 1))
plot(ddjrt_RS86400[,1], diversity, las = 1, ylab="Ratio between diversity (black) or divergence (blue) to mean", xlab="ChrX position", pch=0, main="ddjrt_RS86400")
points(ddjrt_RS86400[,1], divergence, col="blue", pch=16)
legend("topright", legend=c("Diversity", "Divergence"), col=c("black","blue"), pch=c(0,16))

gwcwx_XinXJ24 <- read.table("gwcwx_XinXJ24/chrX/gwcwx_XinXJ24_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")

diversity_corrected <- gwcwx_XinXJ24[,5]/gwcwx_XinXJ24[,6]
is.na(diversity_corrected) <- sapply(diversity_corrected, is.infinite)
diversity <- diversity_corrected/mean(diversity_corrected, na.rm=TRUE)
divergence <- gwcwx_XinXJ24[,6]/mean(gwcwx_XinXJ24[,6])
par(mfrow=c(1,1), mar=c(5, 5, 2, 1))
plot(gwcwx_XinXJ24[,1], diversity, las = 1, ylab="Ratio between diversity (black) or divergence (blue) to mean", xlab="ChrX position", pch=0, main="gwcwx_XinXJ24")
points(gwcwx_XinXJ24[,1], divergence, col="blue", pch=16)
legend("topright", legend=c("Diversity", "Divergence"), col=c("black","blue"), pch=c(0,16))
