# submissions LIFE 4 P

# versione 30 maggio
# 1633 submissions
# 670 impollinatori identificati fino al genere
# 694 impollinatori identificati fino alla famiglia
# 715 impollinatori identificati fino all'ordine
# 637 piante identificate fino al genere
# 686 piante identificate fino alla famiglia

# versione 27 giugno
# 1720 submissions

# versione 3 luglio
# 1732 submissions
# 743 certified
# 844 impollinatori identificati fino al genere
# 920 impollinatori identificati fino alla famiglia
# 959 impollinatori identificati fino all'ordine
# 1243 piante identificate fino al genere
# 1367 piante identificate fino alla famiglia


setwd("C:/Rtesi/")

library(vegan)
library(bipartite)


subcsv <- read.csv("data/sub_en.node.3792_07_03.csv",
                   sep =";",
                   header = T)

View(subcsv)
str(subcsv)
# data.frame:	1732 obs. of  59 variables:

options(max.print=1000000)

# per vedere solo famiglie impollinatori
subcsv$real.taxonomy.pollinator..Family

# per non vedere caselle vuote, bianche (sub non ancora analizzate)
# lascio gli NAs perché rappresentano comunque un dato
subcsv <- subcsv[!(subcsv$real.taxonomy.pollinator..Family == ""), ]

subcsv$real.taxonomy.pollinator..Family
str(subcsv$real.taxonomy.pollinator..Family)

# barplot con etichette perpendicolari
# riduco dimensioni etichette
par(las=2)
barplot(table(subcsv$real.taxonomy.pollinator..Family),
        main = "Families of pollinators",
        ylim = c(0,250),
        cex.axis=0.3, cex.names=0.3)

# immagine png
png(filename = "outputs/pollinators_families.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=2)
barplot(table(subcsv$real.taxonomy.pollinator..Family),
        main = "Families of pollinators",
        ylim = c(0,250),
        cex.axis=0.3, cex.names=0.3)
dev.off()


# per vedere solo famiglie piante
subcsv$real.taxonomy.plant..Family
subcsv <- subcsv[!(subcsv$real.taxonomy.plant..Family == ""), ]

subcsv$real.taxonomy.plant..Family
str(subcsv$real.taxonomy.plant..Family)

par(las=2)
barplot(table(subcsv$real.taxonomy.plant..Family),
        main = "Families of plants",
        ylim = c(0,300),
        cex.axis=0.3, cex.names=0.3)

png(filename = "outputs/plants_families.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=2)
barplot(table(subcsv$real.taxonomy.plant..Family),
        main = "Families of plants",
        ylim = c(0,300),
        cex.axis=0.3, cex.names=0.3)
dev.off()

# per vedere solo gruppi di impollinatori
subcsv$real.taxonomy.pollinator..Group

subcsv <- subcsv[!(subcsv$real.taxonomy.pollinator..Group == ""), ]

subcsv$real.taxonomy.pollinator..Group
str(subcsv$real.taxonomy.pollinator..Group)

# barplot con etichette perpendicolari
# riduco dimensioni etichette
par(las=1)
barplot(table(subcsv$real.taxonomy.pollinator..Group),
        main = "Groups of pollinators",
        ylim = c(0,400),
        cex.axis=0.7, cex.names=0.7)

# immagine gruppi
png(filename = "outputs/pollinators_groups.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=1)
barplot(table(subcsv$real.taxonomy.pollinator..Group),
        main = "Groups of pollinators",
        ylim = c(0,400),
        cex.axis=0.7, cex.names=0.7)
dev.off()


# per vedere solo ordini impollinatori
subcsv$real.taxonomy.pollinator..Order

# per non vedere caselle vuote, bianche (sub non ancora analizzate)
# lascio gli NAs perché rappresentano comunque un dato
subcsv <- subcsv[!(subcsv$real.taxonomy.pollinator..Order == ""), ]

# forse ne omette alcuni?

subcsv$real.taxonomy.pollinator..Order
str(subcsv$real.taxonomy.pollinator..Order)

# barplot con etichette perpendicolari
# riduco dimensioni etichette
par(las=1)
barplot(table(subcsv$real.taxonomy.pollinator..Order),
        main = "Orders of pollinators",
        ylim = c(0,500),
        cex.axis=0.7, cex.names=0.7)

# immagine png
png(filename = "outputs/pollinators_orders.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=1)
barplot(table(subcsv$real.taxonomy.pollinator..Order),
        main = "Orders of pollinators",
        ylim = c(0,500),
        cex.axis=0.7, cex.names=0.7)
dev.off()

# stagioni
subcsv$Season

subcsv <- subcsv[!(subcsv$Season == ""), ]

par(las=1)
barplot(table(subcsv$Season),
        main = "Seasons",
        ylim = c(0,1000),
        cex.axis=0.7, cex.names=0.7)

# paesi
subcsv$Country

subcsv <- subcsv[!(subcsv$Country == ""), ]

par(las=1)
barplot(table(subcsv$Country),
        main = "Countries",
        ylim = c(0,1000),
        cex.axis=0.6, cex.names=0.6)

png(filename = "outputs/countries.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=1)
barplot(table(subcsv$Country),
        main = "Countries",
        ylim = c(0,1000),
        cex.axis=0.6, cex.names=0.6)
dev.off()




# network
library(bipartite)
library(openxlsx)

network_web <- read.xlsx("data/web_network.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(network_web, text.rot=90)

# network stagioni
# autunno
net_aut <- read.xlsx("data/autumn_network.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(net_aut, text.rot=90)

# inverno
net_win <- read.xlsx("data/winter_network.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(net_win, text.rot=90)

# primavera
net_spr <- read.xlsx("data/spring_network.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(net_spr, text.rot=90)

# estate
net_sum <- read.xlsx("data/summer_network.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(net_win, text.rot=90)


# network paesi
# grecia primavera
net_gsp <- read.xlsx("data/net_gree_spr.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(net_gsp, text.rot=90)

# italia primavera
net_isp <- read.xlsx("data/net_ita_spr.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(net_isp, text.rot=90)










