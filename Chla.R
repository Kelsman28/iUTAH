getwd()

read.csv("C:/Users/Julie Kelso/Dropbox/LR_Datasheet")

LRDatasheet = read.csv("C:/Users/Julie Kelso/Desktop/Box Sync/GAMUT_Sampling/CSVs/LR_Datasheet.csv")

Chla = read.csv("C:/Users/Julie Kelso/Dropbox/iUtah/biweekly sampling/Chl a/Chla.csv")

colnames(LRDatasheet)

ValChla = merge(LRDatasheet, Chla, by=c("Date", "SiteCode"))

### remove duplicates ###
done = NPOCTN[!duplicated(NPOCTN[c("Site", "DateCollected", "Analysis")]),]
ValChla = ValChla(!duplicated(ValChla[c("Site", "DateCollected", "Analysis")]),)

write.csv(ValChla, "ValChla.csv")
getwd()
