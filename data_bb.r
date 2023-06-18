# bioblitz 20 maggio

setwd("C:/Rtesi/")

library(vegan)
library(bipartite)

bb <- read.csv("data/bioblitz_20.05.csv",
               sep =";", 
               header = T)
