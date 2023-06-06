setwd("C:/Rtesi/")

library(bipartite) 

data("memmott1999") 
View(memmott1999) 
plotweb(memmott1999) 
visweb(memmott1999) 



#................................................................
setwd("C:/Rtesi/") #directory

library(vegan) #librerie
library(dplyr)

sub <- read.csv("data/sub_en.node.3792_30_05.csv", 
         header = TRUE, sep = ",")
View(sub)


sub_env <- read.table("data/sub_en_30_05.txt",
           header = TRUE, sep = ",")
View(sub_env)

str(sub) #controlla struttura
summary.data.frame(sub)

barplot(table(sub$real.taxonomy.pollinator..Title)) #barplot con etichette perpendicolari
par(las=2)
