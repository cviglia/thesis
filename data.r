# LIFE 4 P

setwd("C:/Rtesi/")

library(vegan)

subcsv <- read.csv("data/sub_en.node.3792_30_05_Copia.csv",
                   sep =";",
                   header = T)

View(subcsv)
str(subcsv)
# data.frame:	1632 obs. of  55 variables

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
        cex.axis=0.3, cex.names=0.3)

# immagine png
png(filename = "outputs/pollinators_families.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=2)
barplot(table(subcsv$real.taxonomy.pollinator..Family),
        main = "Families of pollinators",
        cex.axis=0.3, cex.names=0.3)
dev.off()


str(subcsv$real.taxonomy.pollinator..Family)


# per vedere solo nomi famiglie piante
subcsv$real.taxonomy.pollinator..Family
subcsv <- subcsv[!(subcsv$real.taxonomy.plant..Family == ""), ]

subcsv$real.taxonomy.plant..Family
str(subcsv$real.taxonomy.plant..Family)

par(las=2)
barplot(table(subcsv$real.taxonomy.plant..Family),
        main = "Families of plants",
        cex.axis=0.3, cex.names=0.3)

png(filename = "outputs/plants_families.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=2)
barplot(table(subcsv$real.taxonomy.plants..Family),
        main = "Families of plants",
        cex.axis=0.3, cex.names=0.3)
dev.off()







