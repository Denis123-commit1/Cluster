winedata <- read.csv("WineKMC.csv")

getwd()

winedata [is.na(winedata)] <- 0 # set NA to 0
ncol(winedata)

winedata.trans <- t(winedata[, 8:107])

winedata.trans[1:10, 1:10]

library(skmeans)

winedata.clusters <- skmeans(winedata.trans, k = 5, method = "genetic")

winedata.clusters

str(winedata.clusters)


winedata.clusters$cluster[4]
winedata.clusters$cluster[5]

winedata.clusterscount <- t(aggregate(winedata.trans, 
           by = list(winedata.clusters$cluster), sum) [,2:33])

winedata.bindtable <- cbind(winedata[, 1:7], winedata.clusterscount)
