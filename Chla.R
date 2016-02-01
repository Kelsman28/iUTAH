library(plyr)
library(data.table)

read.csv("C:/Users/Julie Kelso/Dropbox/LR_Datasheet")

LRDatasheet = read.csv("C:/Users/Julie Kelso/Desktop/Box Sync/GAMUT_Sampling/CSVs/LR_Datasheet.csv")

Chla = read.csv("C:/Users/Julie Kelso/Dropbox/iUtah/biweekly sampling/Chl a/Chla.csv", stringsAsFactors = FALSE)

Chla = Chla[-c(414:1048521),]

### remov outliers  ###
Chla$DataValue[Chla$DataValue > 20 ] = "NA"

ValChla = merge(LRDatasheet, Chla, by=c("Date", "SiteCode"), all.y = TRUE)

ValChla <- rowMeans(ValChla[, c(14)])

#average those rows that have multiple values 

write.csv(ValChla, "ValChla.csv")
getwd()
