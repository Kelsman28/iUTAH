library(plyr)
library(data.table)

read.csv("C:/Users/Julie Kelso/Dropbox/LR_Datasheet")

LRDatasheet = read.csv("C:/Users/Julie Kelso/Desktop/Box Sync/GAMUT_Sampling/CSVs/LR_Datasheet.csv")

Chla = read.csv("C:/Users/Julie Kelso/Dropbox/iUtah/biweekly sampling/Chl a/Chla.csv", stringsAsFactors = FALSE)

Chla = Chla[-c(414:1048521),]
Chla = Chla[order(Chla$Watershed, Chla$LocalDateTime),]

### remov outliers  ###
Chla$DataValue[Chla$DataValue > 20 ] = "NA"

ValChla = merge(LRDatasheet, Chla, by=c("Date", "SiteCode"), all.y = TRUE)

### sort byt watershed, Date
ValChla = ValChla[order(ValChla$Watershed, ValChla$LocalDateTime), ]  
#### reorder columns ####
ValChla = ValChla[,c(1,2,14,3:35)]

df[,c(1,2,3,4,5:50)]
ValChla <- rowMeans(ValChla[, c(14)])

#average those rows that have multiple values 

write.csv(ValChla, "ValChla.csv")
getwd()
