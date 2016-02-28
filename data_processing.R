library(dplyr)
library(tidyr)
#library(reshape2)
#library(ggplot2)
library(lubridate)

options(scipen=999)

#Data set loaded from:
#http://files.zillowstatic.com/research/public/Metro.zip
pricesqft <- read.csv("C:/Users/siup/Documents/Coursera/Developing Data Products/Zillow data/Metro/Metro_MedianSoldPricePerSqft_AllHomes.csv")

pricesqft$RegionID <- NULL
pricesqft$SizeRank <- NULL

colnames(pricesqft) <- c("Metro", as.character(seq.Date(as.Date("1996-04-01"), by="1 month", length.out=238)))

pricesqft <- gather(pricesqft, "Date", "Median", 2:239)
pricesqft$Date <- ymd(pricesqft$Date)
pricesqft <- pricesqft[complete.cases(pricesqft),]

saveRDS(pricesqft, "pricesqft.RDS")
