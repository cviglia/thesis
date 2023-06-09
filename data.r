# LIFE4P

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

# alcuni dati sono scritti male, quindi ho modificato il file
#.............................................................

setwd("C:/Rtesi/")

library(vegan)

subcsv <- read.csv("data/sub_en.node.3792_30_05_Copia.csv",
           sep =";",
           header = T)


View(subcsv)
str(subcsv)
# 'data.frame': 1632 obs. of  45 variables


# to see omitted rows
options(max.print=1000000)
# per vedere solo i nomi degli impollinatori
subcsv$real.taxonomy.pollinator..Title

# rimuovo celle bianche (sub non ancora analizzate)
# lascio gli NAs perché rappresentano comunque un dato
subcsv <- subcsv[!(subcsv$real.taxonomy.pollinator..Title == ""), ]

# ricontrollo solo i nomi degli impollinatori
subcsv$real.taxonomy.pollinator..Title

# struttura colonna nomi impollinatori
str(subcsv$real.taxonomy.pollinator..Title)
# character data types [1:730]

# barplot con etichette perpendicolari
# riduco dimensioni etichette
par(las=2)
barplot(table(subcsv$real.taxonomy.pollinator..Title),
        main = "Taxonomy of pollinators",
        cex.axis=0.3, cex.names=0.3)

# immagine png
png(filename = "outputs/barplot.png",
    width = 1800,
    height = 1800,
    res = 300)
par(las=2)
barplot(table(subcsv$real.taxonomy.pollinator..Title),
        main = "Taxonomy of pollinators",
        cex.axis=0.3, cex.names=0.3)
dev.off()








#................................................................
setwd("C:/Rtesi/")

library(bipartite) 

data("memmott1999") 
View(memmott1999) 
plotweb(memmott1999) 
visweb(memmott1999) 

#................................................................
# tentativi
library("readxl")

subex <- read_excel("data/sub_en.node.3792_30_05_Copia.xlsx")
View(subex)

setwd("C:/Rtesi/")
library(vegan)

read.table("data/sub_en.node.3792_30_05_Copia.txt",
           sep =" ",
           header = T)

library("readxl")

subex <- read_excel("data/sub_en.node.3792_30_05_Copia.xlsx")
View(subex)

str(subex)

subcsv <- read.csv("data/sub_en.node.3792_30_05_Copia.csv", 
                header = TRUE, sep = ",")
View(subcsv)







