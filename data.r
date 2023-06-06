setwd("C:/Rtesi/")

library(bipartite) 

data("memmott1999") 
View(memmott1999) 
plotweb(memmott1999) 
visweb(memmott1999) 



#................................................................
#directory
setwd("C:/Rtesi/") 

#librerie
library(vegan) 
library(dplyr)

sub <- read.csv("data/sub_en.node.3792_30_05.csv", 
         header = TRUE, sep = ",")
View(sub)


sub_env <- read.table("data/sub_en_30_05.txt",
           header = TRUE, sep = ",")
View(sub_env)

#controlla struttura
str(sub) 
summary.data.frame(sub)

# barplot con etichette perpendicolari
par(las=2) 
barplot(table(sub$real.taxonomy.pollinator..Title),
        main = "Taxonomy pollinators")

# immagine png
png(filename = "outputs/barplot.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=2)
barplot(table(sub$real.taxonomy.pollinator..Title),
        main = "Taxonomy pollinators")
dev.off()

