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
# 1728 submissions
# 743 certified
# 844 impollinatori identificati fino al genere
# 920 impollinatori identificati fino alla famiglia
# 959 impollinatori identificati fino all'ordine
# 1243 piante identificate fino al genere
# 1367 piante identificate fino alla famiglia

# versione 25 agosto sub_en.node.3792_08_25
# 1769 submissions
# 982 certified, 344 validated
# 1190 impollinatori identificati fino al genere
# 1355 impollinatori identificati fino alla famiglia
# 1560 impollinatori identificati fino all'ordine
# 1294 piante identificate fino al genere
# 1443 piante identificate fino alla famiglia


setwd("C:/Rtesi/")

library(vegan)
library(bipartite)


subcsv <- read.csv("data/sub_en.node.3792_08_25.csv",
                   sep =";",
                   header = T)

View(subcsv)
str(subcsv)
# data.frame:	1732 obs. of  59 variables:

options(max.print=1000000)

# per vedere solo famiglie impollinatori
subcsv$real.taxonomy.pollinator..Family
# per non vedere caselle vuote, bianche (sub non ancora analizzate)
subcsv <- subcsv[!(subcsv$real.taxonomy.pollinator..Family == ""), ]

subcsv$real.taxonomy.pollinator..Family
str(subcsv$real.taxonomy.pollinator..Family)


# per vedere solo famiglie piante
subcsv$real.taxonomy.plant..Family
# per non vedere caselle vuote, bianche (sub non ancora analizzate)
subcsv <- subcsv[!(subcsv$real.taxonomy.plant..Family == ""), ]

subcsv$real.taxonomy.plant..Family
str(subcsv$real.taxonomy.plant..Family)



# per vedere solo gruppi di impollinatori
subcsv$real.taxonomy.pollinator..Group

subcsv <- subcsv[!(subcsv$real.taxonomy.pollinator..Group == ""), ]

subcsv$real.taxonomy.pollinator..Group
str(subcsv$real.taxonomy.pollinator..Group)

# barplot con etichette parallele
# riduco dimensioni etichette
par(las=1)
barplot(table(subcsv$real.taxonomy.pollinator..Group),
        main = "Groups of pollinators",
        ylim = c(0,500),
        cex.axis=0.7, cex.names=0.7)

# immagine gruppi
png(filename = "outputs/pollinators_groups.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=1)
barplot(table(subcsv$real.taxonomy.pollinator..Group),
        main = "Groups of pollinators",
        ylim = c(0,500),
        cex.axis=0.7, cex.names=0.7)
dev.off()


# per vedere solo ordini impollinatori
subcsv$real.taxonomy.pollinator..Order

# per non vedere caselle vuote, bianche (sub non ancora analizzate)
subcsv <- subcsv[!(subcsv$real.taxonomy.pollinator..Order == ""), ]

subcsv$real.taxonomy.pollinator..Order
str(subcsv$real.taxonomy.pollinator..Order)

# barplot con etichette parallele
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

plotweb(network_web, labsize = 1, text.rot=90, y.lim=c(0,2.0))

# network stagioni
# autunno
net_aut <- read.xlsx("data/autumn_network.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(net_aut, text.rot=90, y.lim=c(0,2.0))

# inverno
net_win <- read.xlsx("data/winter_network.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(net_win, text.rot=90, y.lim=c(0,2.0))

# primavera
net_spr <- read.xlsx("data/spring_network.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(net_spr, text.rot=90, y.lim=c(0,2.0))

# estate
net_sum <- read.xlsx("data/summer_network.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(net_win, text.rot=90, y.lim=c(0,2.0))


# network paesi
# grecia primavera
net_gsp <- read.xlsx("data/net_gree_spr.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(net_gsp, text.rot=90, y.lim=c(0,2.0))

# italia primavera
net_isp <- read.xlsx("data/net_ita_spr.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(net_isp, text.rot=90, y.lim=c(0,2.0))

# spagna primavera
net_ssp <- read.xlsx("data/net_spa_spr.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(net_ssp, text.rot=90, y.lim=c(0,2.0))



# network sindrome
net_syn <- read.xlsx("data/syndr_network.xlsx", colNames = TRUE, rowNames = TRUE)

plotweb(net_syn, text.rot=90, y.lim=c(0,2.0))

# colorare vettori
# Carica il network
net_syn <- read.xlsx("data/syndr_network.xlsx", colNames = TRUE, rowNames = TRUE)

# Definisci un vettore di colori per le interazioni
interaction_colors <- c("dark red", "white", "orange", "yellow", "light blue", "dark green", "pink")

plotweb(net_syn, labsize = 1.5, text.rot = 90, y.lim = c(0, 2.0), col.interaction = interaction_colors)








