getwd()

read.csv("C:/Users/Julie Kelso/Dropbox/LR_Datasheet")

LRDatasheet = read.csv("C:/Users/Julie Kelso/Desktop/Box Sync/GAMUT_Sampling/CSVs/LR_Datasheet.csv")

Chla = read.csv("C:/Users/Julie Kelso/Dropbox/iUtah/biweekly sampling/Chl a/Chla.csv")

colnames(FPOMDIC)[c(3,4,5,8,9,10)] <- c("Watershed", "month", "DIC", "d13C", "d15N", "CtoN")

ValChla = merge(LRDatasheet, Chla, by=c("Date"))

### remove duplicates ###
done = NPOCTN[!duplicated(NPOCTN[c("Site", "DateCollected", "Analysis")]),]
ValChla = ValChla(!duplicated(ValChla[c("Site", "DateCollected", "Analysis")]),)

write.csv(ValChla, "ValChla.csv")
getwd()
