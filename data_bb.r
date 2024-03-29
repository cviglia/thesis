setwd("C:/Rtesi/")

library(vegan)

# bioblitz 20 maggio
bb20 <- read.csv("data/bioblitz_20.05.csv",
                 sep =";", 
                 header = T)
bb20
View(bb20)

# pollinators groups bioblitz 20
par(las=1)
barplot(table(bb20$ï..pollinator),
        main = "Groups of pollinators",
        ylim = c(0,120),
        cex.axis=0.7, cex.names=0.7)

png(filename = "outputs/groups_bioblitz_20.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=1)
barplot(table(bb20$ï..pollinator),
        main = "Groups of pollinators",
        ylim = c(0,120),
        cex.axis=0.7, cex.names=0.7)
dev.off()


# plants families bioblitz
par(las=2)
barplot(table(bb20$plant),
        main = "Families of plants",
        ylim = c(0,120),
        cex.axis=0.7, cex.names=0.7)

# immagine png
png(filename = "outputs/families_bioblitz_20.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=2)
barplot(table(bb20$plant),
        main = "Families of plants",
        ylim = c(0,120),
        cex.axis=0.7, cex.names=0.7)
dev.off()


# network
setwd("C:/Rtesi/")
library(bipartite)
library(openxlsx)

network_bb20 <- read.xlsx("data/bb20.05_network.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(network_bb20, labsize = 1.5, text.rot=90, y.lim=c(0,2.0))



# bioblitz 6 maggio
bb06 <- read.csv("data/bioblitz_06.05.csv",
               sep =";", 
               header = T)

# pollinators groups bioblitz
par(las=1)
barplot(table(bb06$ï..pollinator),
        main = "Groups of pollinators",
        ylim = c(0,160),
        cex.axis=0.7, cex.names=0.7)

# immagine png
png(filename = "outputs/groups_bioblitz_06.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=1)
barplot(table(bb06$ï..pollinator),
        main = "Groups of pollinators",
        ylim = c(0,160),
        cex.axis=0.7, cex.names=0.7)
dev.off()

# plants families bioblitz
par(las=2)
barplot(table(bb06$plant),
        main = "Families of plants",
        ylim = c(0,80),
        cex.axis=0.7, cex.names=0.7)

# immagine png
png(filename = "outputs/families_bioblitz_06.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=2)
barplot(table(bb06$plant),
        main = "Families of plants",
        ylim = c(0,80),
        cex.axis=0.7, cex.names=0.7)
dev.off()


# network
setwd("C:/Rtesi/")
library(bipartite)
library(openxlsx)


network_bb06 <- read.xlsx("data/bb06.05_network.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(network_bb06, labsize = 1.5, text.rot=90, y.lim=c(0,2.0))




# sankey
library(networkD3)
library(dplyr)

# "Bee", "Wasp", "Hover fly", "Bee fly", "Beetle", "Butterfly", "Moth"

# san lazzaro

# "Plantaginaceae"	"Oxalidaceae"	"Geraniaceae" "Paeoniaceae"	
# "Liliaceae"	"Asteraceae"  "Lamiaceae"	"Rosaceae"		


links <- data.frame(
  source=c("Bee","Bee", "Bee", "Bee", "Bee", "Bee", "Bee", "Wasp", "Wasp", 
           "Hover fly","Hover fly","Hover fly","Bee fly", "Butterfly"), 
  target=c("Plantaginaceae","Oxalidaceae", "Paeoniaceae", "Liliaceae","Asteraceae", "Lamiaceae","Rosaceae", "Lamiaceae", "Rosaceae",
           "Plantaginaceae","Geraniaceae", "Paeoniaceae", "Oxalidaceae", "Liliaceae"), 
  value=c(6, 16, 69, 16, 1, 34, 4, 6, 2, 3, 3, 4, 2, 1))



nodes <- data.frame(
  name=c(as.character(links$source), 
         as.character(links$target)) %>% unique())

links$IDsource <- match(links$source, nodes$name)-1 
links$IDtarget <- match(links$target, nodes$name)-1

p <- sankeyNetwork(Links = links, Nodes = nodes,
                   Source = "IDsource", Target = "IDtarget",
                   Value = "value", NodeID = "name", fontSize= 15,
                   sinksRight=FALSE)
p


# Skocjan Caves 

# "Ranunculaceae", "Euphorbiaceae",	"Fabaceae",	"Asteraceae",	"Lamiaceae",
# "Rosaceae",	"Polygalaceae", "Apiaceae",	"Caprifoliaceae"		

links <- data.frame(
  source=c("Bee", "Bee", "Bee", "Bee", "Bee", "Bee", "Wasp", "Wasp", "Wasp",
           "Hover fly", "Hover fly", "Hover fly", "Hover fly", "Hover fly", "Hover fly", "Hover fly", 
           "Bee fly", "Bee fly", "Bee fly",
           "Beetle", "Beetle", "Beetle", "Beetle", "Beetle", "Beetle", "Beetle", "Beetle",
           "Butterfly", "Butterfly",  "Butterfly", "Butterfly", "Butterfly", 
           "Moth"), 
  target=c("Ranunculaceae", "Fabaceae", "Lamiaceae", "Rosaceae", "Apiaceae", "Caprifoliaceae",
           "Ranunculaceae", "Fabaceae", "Lamiaceae",
           "Ranunculaceae", "Euphorbiaceae",	"Fabaceae", "Asteraceae", "Lamiaceae", "Rosaceae", "Polygalaceae", 
           "Ranunculaceae", "Fabaceae", "Lamiaceae", 
           "Ranunculaceae", "Euphorbiaceae", 	"Fabaceae", "Asteraceae", "Lamiaceae", "Rosaceae", "Polygalaceae", "Apiaceae",
           "Ranunculaceae", "Euphorbiaceae", "Fabaceae",  "Rosaceae", "Apiaceae",
           "Ranunculaceae"), 
  value=c(26, 45, 24, 2, 4, 2, 1, 2, 1, 15, 1, 1, 2, 7, 1, 1, 1, 16, 5, 15, 3, 37, 1, 8, 2, 1, 1, 1, 2, 7, 1, 4, 5))


nodes <- data.frame(
  name=c(as.character(links$source), 
         as.character(links$target)) %>% unique()
)

links$IDsource <- match(links$source, nodes$name)-1 
links$IDtarget <- match(links$target, nodes$name)-1

p <- sankeyNetwork(Links = links, Nodes = nodes,
                   Source = "IDsource", Target = "IDtarget",
                   Value = "value", NodeID = "name", fontSize= 15,
                   sinksRight=FALSE)
p





