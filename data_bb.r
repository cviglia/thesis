# bioblitz 20 maggio

setwd("C:/Rtesi/")

library(vegan)
library(networkD3)

bb20 <- read.csv("data/bioblitz_20.05.csv",
                 sep =";", 
                 header = T)
bb20
View(bb20)

# pollinators groups bioblitz 20
par(las=2)
barplot(table(bb20$ï..pollinator),
        main = "Groups of pollinators",
        cex.axis=0.3, cex.names=0.3)

# immagine png
png(filename = "outputs/groups_bioblitz_20.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=2)
barplot(table(bb20$ï..pollinator),
        main = "Groups of pollinators",
        cex.axis=0.3, cex.names=0.3)
dev.off()


# plants families bioblitz
par(las=2)
barplot(table(bb20$plant),
        main = "Families of plants",
        cex.axis=0.3, cex.names=0.3)

# immagine png
png(filename = "outputs/families_bioblitz_20.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=2)
barplot(table(bb20$plant),
        main = "Families of plants",
        cex.axis=0.3, cex.names=0.3)
dev.off()


# network
setwd("C:/Rtesi/")
library(bipartite)
library(openxlsx)

network_bb20 <- read.xlsx("data/bb20.05_network.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(network_bb20, text.rot=90)



# bioblitz 6 maggio
bb06 <- read.csv("data/bioblitz_06.05.csv",
               sep =";", 
               header = T)

# pollinators groups bioblitz
par(las=2)
barplot(table(bb06$ï..pollinator),
        main = "Groups of pollinators",
        cex.axis=0.3, cex.names=0.3)

# immagine png
png(filename = "outputs/groups_bioblitz_06.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=2)
barplot(table(bb06$ï..pollinator),
        main = "Groups of pollinators",
        cex.axis=0.3, cex.names=0.3)
dev.off()

# plants groups bioblitz
par(las=2)
barplot(table(bb06$plant),
        main = "Families of plants",
        cex.axis=0.3, cex.names=0.3)

# immagine png
png(filename = "outputs/families_bioblitz_06.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=2)
barplot(table(bb06$plant),
        main = "Families of plants",
        cex.axis=0.3, cex.names=0.3)
dev.off()


# network
setwd("C:/Rtesi/")
library(bipartite)
library(openxlsx)

network_bb06 <- read.xlsx("data/bb06.05_network.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(network_bb06, text.rot=90)


