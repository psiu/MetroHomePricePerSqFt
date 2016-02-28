library(dplyr)
library(tidyr)
library(lubridate)

options(scipen=999)

#The original data set is from:
#http://files.zillowstatic.com/research/public/Metro/Metro_MedianSoldPricePerSqft_AllHomes.csv
#However, to prevent the data set from updating, we will use a static copy from the GitHub repository
rawDataFile <- "Metro_MedianSoldPricePerSqft_AllHomes.csv"
downloadURL <- "https://github.com/psiu/MetroHomePricePerSqFt/raw/master/Metro_MedianSoldPricePerSqft_AllHomes.csv"
downloadURL_original <- "http://files.zillowstatic.com/research/public/Metro/Metro_MedianSoldPricePerSqft_AllHomes.csv"

if(!file.exists(rawDataFile)){
    download.file(downloadURL, rawDataFile)
}

## Load data from data file
pricesqft <- read.csv("Metro_MedianSoldPricePerSqft_AllHomes.csv")

# Remove unnecessary columns
pricesqft$RegionID <- NULL
pricesqft$SizeRank <- NULL

# Rename columns for readability
colnames(pricesqft) <- c("Metro", as.character(seq.Date(as.Date("1996-04-01"), by="1 month", length.out=238)))

# Restructure data set to long format
pricesqft <- gather(pricesqft, "Date", "Median", 2:239)

# Reclass Date column from character to date
pricesqft$Date <- ymd(pricesqft$Date)

# Remove empty NA rows
pricesqft <- pricesqft[complete.cases(pricesqft),]

# Output clean data set
saveRDS(pricesqft, "pricesqft.RDS")
