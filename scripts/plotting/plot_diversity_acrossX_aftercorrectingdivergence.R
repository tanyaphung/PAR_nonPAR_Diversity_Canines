setwd("/home/tanya/Dropbox/grad_school/Research/PAR_Canines_WorkComputer/analyses/R_filter_windows/")

ddair_RS74411 <- read.table("ddair_RS74411/chrX/ddair_RS74411_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
ddbas_RS80704 <- read.table("ddbas_RS80704/chrX/ddbas_RS80704_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
ddbdt_RS86407 <- read.table("ddbdt_RS86407/chrX/ddbdt_RS86407_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
ddbrt_RS86399 <- read.table("ddbrt_RS86399/chrX/ddbrt_RS86399_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
ddjrt_RS86400 <- read.table("ddjrt_RS86400/chrX/ddjrt_RS86400_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")

ddjrt_RS86404 <- read.table("ddjrt_RS86404/chrX/ddjrt_RS86404_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
ddkbt_RS74408 <- read.table("ddkbt_RS74408/chrX/ddkbt_RS74408_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
ddlab_RS86398 <- read.table("ddlab_RS86398/chrX/ddlab_RS86398_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
ddpwc_RS73323 <- read.table("ddpwc_RS73323/chrX/ddpwc_RS73323_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
ddpwc_RS86409 <- read.table("ddpwc_RS86409/chrX/ddpwc_RS86409_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")

ddsct_RS86393 <- read.table("ddsct_RS86393/chrX/ddsct_RS86393_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
ddwhw_RS86397 <- read.table("ddwhw_RS86397/chrX/ddwhw_RS86397_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
ddbox_RKWUCLA <- read.table("ddbox_RKWUCLA/chrX/ddbox_RKWUCLA_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
gwcwx_XinXJ24 <- read.table("gwcwx_XinXJ24/chrX/gwcwx_XinXJ24_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
gwcwz_RKW3916 <- read.table("gwcwz_RKW3916/chrX/gwcwz_RKW3916_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")

gwibe_XXWIB98 <- read.table("gwibe_XXWIB98/chrX/gwibe_XXWIB98_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
gwirw_RKW3073 <- read.table("gwirw_RKW3073/chrX/gwirw_RKW3073_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
gwprt_LOBO423 <- read.table("gwprt_LOBO423/chrX/gwprt_LOBO423_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
gwynp_RWK1547 <- read.table("gwynp_RWK1547/chrX/gwynp_RWK1547_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")
gjtel_RKW1332 <- read.table("gjtel_RKW1332/chrX/gjtel_RKW1332_chrX_diversity_divergence_removeLowCallbleLowDiversity.txt")

ddair_RS74411_diversity_corrected <- ddair_RS74411[,5]/ddair_RS74411[,6]
ddbas_RS80704_diversity_corrected <- ddbas_RS80704[,5]/ddbas_RS80704[,6]
ddbdt_RS86407_diversity_corrected <- ddbdt_RS86407[,5]/ddbdt_RS86407[,6]
ddbrt_RS86399_diversity_corrected <- ddbrt_RS86399[,5]/ddbrt_RS86399[,6]
ddjrt_RS86400_diversity_corrected <- ddjrt_RS86400[,5]/ddjrt_RS86400[,6]

ddjrt_RS86404_diversity_corrected <- ddjrt_RS86404[,5]/ddjrt_RS86404[,6]
ddkbt_RS74408_diversity_corrected <- ddkbt_RS74408[,5]/ddkbt_RS74408[,6]
ddlab_RS86398_diversity_corrected <- ddlab_RS86398[,5]/ddlab_RS86398[,6]
ddpwc_RS73323_diversity_corrected <- ddpwc_RS73323[,5]/ddpwc_RS73323[,6]
ddpwc_RS86409_diversity_corrected <- ddpwc_RS86409[,5]/ddpwc_RS86409[,6]

ddsct_RS86393_diversity_corrected <- ddsct_RS86393[,5]/ddsct_RS86393[,6]
ddwhw_RS86397_diversity_corrected <- ddwhw_RS86397[,5]/ddwhw_RS86397[,6]
ddbox_RKWUCLA_diversity_corrected <- ddbox_RKWUCLA[,5]/ddbox_RKWUCLA[,6]
gwcwx_XinXJ24_diversity_corrected <- gwcwx_XinXJ24[,5]/gwcwx_XinXJ24[,6]
gwcwz_RKW3916_diversity_corrected <- gwcwz_RKW3916[,5]/gwcwz_RKW3916[,6]

gwibe_XXWIB98_diversity_corrected <- gwibe_XXWIB98[,5]/gwibe_XXWIB98[,6]
gwirw_RKW3073_diversity_corrected <- gwirw_RKW3073[,5]/gwirw_RKW3073[,6]
gwprt_LOBO423_diversity_corrected <- gwprt_LOBO423[,5]/gwprt_LOBO423[,6]
gwynp_RWK1547_diversity_corrected <- gwynp_RWK1547[,5]/gwynp_RWK1547[,6]
gjtel_RKW1332_diversity_corrected <- gjtel_RKW1332[,5]/gjtel_RKW1332[,6]

par(mfrow=c(4,5), mar=c(3,4,5,3))
plot(ddair_RS74411[,1], ddair_RS74411_diversity_corrected, xlab="", ylab="", las=1, main="ddair_RS74411", cex.main=1.5)
plot(ddbas_RS80704[,1], ddbas_RS80704_diversity_corrected, xlab="", ylab="", las=1, main="ddbas_RS80704", cex.main=1.5)
plot(ddbdt_RS86407[,1], ddbdt_RS86407_diversity_corrected, xlab="", ylab="", las=1, main="ddbdt_RS86407", cex.main=1.5)
plot(ddbrt_RS86399[,1], ddbrt_RS86399_diversity_corrected, xlab="", ylab="", las=1, main="ddbrt_RS86399", cex.main=1.5)
plot(ddjrt_RS86400[,1], ddjrt_RS86400_diversity_corrected, xlab="", ylab="", las=1, main="ddjrt_RS86400", cex.main=1.5)

plot(ddjrt_RS86404[,1], ddjrt_RS86404_diversity_corrected, xlab="", ylab="", las=1, main="ddjrt_RS86404", cex.main=1.5)
plot(ddkbt_RS74408[,1], ddkbt_RS74408_diversity_corrected, xlab="", ylab="", las=1, main="ddkbt_RS74408", cex.main=1.5)
plot(ddlab_RS86398[,1], ddlab_RS86398_diversity_corrected, xlab="", ylab="", las=1, main="ddlab_RS86398", cex.main=1.5)
plot(ddpwc_RS73323[,1], ddpwc_RS73323_diversity_corrected, xlab="", ylab="", las=1, main="ddpwc_RS73323", cex.main=1.5)
plot(ddpwc_RS86409[,1], ddpwc_RS86409_diversity_corrected, xlab="", ylab="", las=1, main="ddpwc_RS86409", cex.main=1.5)

plot(ddsct_RS86393[,1], ddsct_RS86393_diversity_corrected, xlab="", ylab="", las=1, main="ddsct_RS86393", cex.main=1.5)
plot(ddwhw_RS86397[,1], ddwhw_RS86397_diversity_corrected, xlab="", ylab="", las=1, main="ddwhw_RS86397", cex.main=1.5)
plot(ddbox_RKWUCLA[,1], ddbox_RKWUCLA_diversity_corrected, xlab="", ylab="", las=1, main="ddbox_RKWUCLA", cex.main=1.5)
plot(gwcwx_XinXJ24[,1], gwcwx_XinXJ24_diversity_corrected, xlab="", ylab="", las=1, main="gwcwx_XinXJ24", cex.main=1.5)
plot(gwcwz_RKW3916[,1], gwcwz_RKW3916_diversity_corrected, xlab="", ylab="", las=1, main="gwcwz_RKW3916", cex.main=1.5)

plot(gwibe_XXWIB98[,1], gwibe_XXWIB98_diversity_corrected, xlab="", ylab="", las=1, main="gwibe_XXWIB98", cex.main=1.5)
plot(gwirw_RKW3073[,1], gwirw_RKW3073_diversity_corrected, xlab="", ylab="", las=1, main="gwirw_RKW3073", cex.main=1.5)
plot(gwprt_LOBO423[,1], gwprt_LOBO423_diversity_corrected, xlab="", ylab="", las=1, main="gwprt_LOBO423", cex.main=1.5)
plot(gwynp_RWK1547[,1], gwynp_RWK1547_diversity_corrected, xlab="", ylab="", las=1, main="gwynp_RWK1547", cex.main=1.5)
plot(gjtel_RKW1332[,1], gjtel_RKW1332_diversity_corrected, xlab="", ylab="", las=1, main="gjtel_RKW1332", cex.main=1.5)
