# Cluster
Collect wine buyers data to divide them into clusters

winedata <- read.csv("WineKMC.csv") # extrat data from csv format

getwd()

winedata [is.na(winedata)] <- 0 # set NA to 0
ncol(winedata)

winedata.trans <- t(winedata[, 8:107]) # transposing our data to ease analysis process

winedata.trans[1:10, 1:10]

library(skmeans) # downlowad library 

winedata.clusters <- skmeans(winedata.trans, k = 5, method = "genetic") # use method skmeans to analyse data

winedata.clusters # present data 

str(winedata.clusters) # present description of analyzed data 


winedata.clusters$cluster[4] # check person's number to the cluster 
winedata.clusters$cluster[5]

winedata.clusterscount <- t(aggregate(winedata.trans, 
           by = list(winedata.clusters$cluster), sum) [,2:33]) # present couned results to data 

winedata.bindtable <- cbind(winedata[, 1:7], winedata.clusterscount) # present ended result 
