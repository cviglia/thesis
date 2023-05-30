# set directory
setwd("C:/Rtesi/")

# see the old data
life4p <- read.csv(file = "data/3792.csv", header = TRUE, sep = ",")
head(life4p)

#...............................................................
setwd("C:/Rtesi/")

library(bipartite) 

data("memmott1999") 
View(memmott1999) 
plotweb(memmott1999) 
visweb(memmott1999) 



#................................................................
setwd("C:/Rtesi/")

library(vegan)

sub <- read.csv("data/sub_en.node.3792_30_05.csv", 
         header = TRUE, sep = ",")
View(sub)


sub_env <- read.table("data/sub_en_30_05.txt",
           header = TRUE, sep = ",")
View(sub_env)

