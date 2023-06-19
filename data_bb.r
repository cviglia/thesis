# bioblitz 20 maggio

setwd("C:/Rtesi/")

library(vegan)
library(networkD3)

bb <- read.csv("data/bioblitz_20.05.csv",
               sep =";", 
               header = T)

# pollinators groups bioblitz
par(las=2)
barplot(table(bb$ï..pollinator),
        main = "Groups of pollinators",
        cex.axis=0.3, cex.names=0.3)

# immagine png
png(filename = "outputs/groups_bioblitz.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=2)
barplot(table(bb$ï..pollinator),
        main = "Groups of pollinators",
        cex.axis=0.3, cex.names=0.3)
dev.off()

# plants groups bioblitz
par(las=2)
barplot(table(bb$plant),
        main = "Families of plants",
        cex.axis=0.3, cex.names=0.3)

# immagine png
png(filename = "outputs/families_bioblitz.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=2)
barplot(table(bb$plant),
        main = "Families of plants",
        cex.axis=0.3, cex.names=0.3)
dev.off()


# network
setwd("C:/Rtesi/")
library(bipartite)
library(openxlsx)

network <- read.xlsx("data/bb20.05_network.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(network)




