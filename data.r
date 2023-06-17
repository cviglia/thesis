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

# per vedere solo nomi famiglie impollinatori
subcsv$real.taxonomy.pollinator..Family

# per non vedere caselle vuote
subcsv <- subcsv[!(subcsv$real.taxonomy.pollinator..Family == ""), ]

subcsv$real.taxonomy.pollinator..Family
str(subcsv$real.taxonomy.pollinator..Family)

# barplot
par(las=2)
barplot(table(subcsv$real.taxonomy.pollinator..Family),
        main = "Taxonomy of pollinators",
        cex.axis=0.3, cex.names=0.3)

# immagine png
png(filename = "outputs/barplot.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=2)
barplot(table(subcsv$real.taxonomy.pollinator..Family),
        main = "Taxonomy of pollinators",
        cex.axis=0.3, cex.names=0.3)
dev.off()


str(subcsv$real.taxonomy.pollinator..Family)








