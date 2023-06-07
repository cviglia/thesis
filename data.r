setwd("C:/Rtesi/")

library(bipartite) 

data("memmott1999") 
View(memmott1999) 
plotweb(memmott1999) 
visweb(memmott1999) 



#................................................................
# directory
setwd("C:/Rtesi/") 

# librerie
library(vegan) 

sub <- read.csv("data/sub_en.node.3792_30_05.csv", 
         header = TRUE, sep = ",")
View(sub)

# controlla struttura
str(sub) 
# data.frame with	1632 obs. of  45 variables

# summary
summary.data.frame(sub)

# to see omitted rows
options(max.print=1000000)
# per vedere solo i nomi degli impollinatori
sub$real.taxonomy.pollinator..Title

# rimuovere celle bianche
sub <- sub[!(sub$real.taxonomy.pollinator..Title == ""), ]

# barplot con etichette perpendicolari
# riduco dimensioni etichette
par(las=2)
barplot(table(sub$real.taxonomy.pollinator..Title),
        main = "Taxonomy pollinators",
        cex.axis=0.3, cex.names=0.3)

# immagine png
png(filename = "outputs/barplot.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=2)
barplot(table(sub$real.taxonomy.pollinator..Title),
        main = "Taxonomy pollinators",
        cex.axis=0.3, cex.names=0.3)
dev.off()
