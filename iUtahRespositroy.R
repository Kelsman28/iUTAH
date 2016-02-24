require(ggplot2)
library(ggplot2)
library(doBy)
library(stringr)
library(plyr)
library(reshape2)
library(xlsx)
library(XLConnect)
library(XLConnectJars)
library(data.table)
library(stats)
library(tidyr)

SepCN = read.csv("C:/Users/Julie Kelso/Dropbox/All Isotopes/iUtahRespository/SepCN.csv", stringsAsFactors = FALSE)
SepH = read.csv("C:/Users/Julie Kelso/Dropbox/All Isotopes/iUtahRespository/SepH.csv", stringsAsFactors = FALSE)

colnames(SepH)[c(1,9,10,14)] <- c("SampleID","dD", "PerH", "NumericDate")

### reduce SepH to columns listed in myvars
myvars <- c("SampleID" , "dD","PerH","Comments","Sample.ID","Description",
            "NumericDate","Month","Watershed","Site.ID","TrayName")
SepH <- SepH[myvars]

SepH = SepH[-c(63:1048294),]

#LR_HWY252  should be 140913 but is 140915
SepCN$Date[SepCN$Reach == "LR_HWY252"] <- "140913"
SepCN$Date[SepCN$Reach == "LR_MainSt_BA"] <- "140911"
SepCN$Date[SepCN$Reach == "LR_TonyGrove_BA"] <- "140904"
SepCN$Date[SepCN$Reach == "PR_CanyonView" ] <- "140903"
SepCN$Date[SepCN$Reach == "PR_CH_AA"] <- "140903"
SepCN$Date[SepCN$Reach == "PR_LM_BA"] <- "140903"

### for all RB sites
SepCN$Date[SepCN$Reach %in% c("RB_1300E","RB_1300S","RB_ARBR_AA","RB_CG_BA","RB_FD_AA", 
                              "RB_KF_BA" ,"RB_RBG_BA","RB_TM")] = "140901"

### Now change to correct dates in SepH
SepH$NumericDate[SepH$Site.ID %in% c("RB_1300E","RB_1300S","RB_ARBR_AA","RB_CG_BA","RB_FD_AA", "RB_KF_BA" ,"RB_RBG_BA","RB_TM")] = "140901"

SepH$Site.ID[SepH$Site.ID == "PR_SpringCreek600W500N"] <- "PR_SpringCreek"

SepH$NumericDate[SepH$Site.ID %in% c("PR_BJ_AA","PR_LM_BA","PR_SpringCreek","PR_SnakeCreekRR","PR_CH_AA","PR_Vivian","PR_CanyonViewPark")] = "140903"           
SepH$NumericDate[SepH$Site.ID == "LR_HWY252"] <- "140913"
SepH$NumericDate[SepH$Site.ID == "LR_MainSt_BA"] <- "140911"
SepH$NumericDate[SepH$Site.ID == "LR_TonyGrove_BA"] <- "140904"
SepH$NumericDate[SepH$Site.ID == "LR_WaterLab_AA"] <- "140904"
SepH$NumericDate[SepH$Site.ID == "LR_MainSt_BA"] <- "140911"

SepH$NumericDate[SepH$Site.ID %in% c("2300","3300","MillUp","MillDown","Cudahy")] = "140912"

write.csv(SepCN, "SepCNfinal.csv")
write.csv(SepH, "SepHfinal.csv")

colnames(SepCN)[c(4,7)] <- c("Site.ID","NumericDate")
colnames(SepH)[c(6)] <- c("Endmember")

## Now need to summarize SepCNfinal to average out duplicate records of CN values for JR and a few pro

SepCNfinal = read.csv("C:/Users/Julie Kelso/Dropbox/iUtah/biweekly sampling/iUTAH proj/iUTAH/iUtahRepositoryIsotopes/iUTAH/SepCNfinal.csv")

SepHfinal = read.csv("C:/Users/Julie Kelso/Dropbox/iUtah/biweekly sampling/iUTAH proj/iUTAH/iUtahRepositoryIsotopes/iUTAH/SepHfinal.csv")

###############################################
SepCNfinal = data.frame(SepCNfinal)
agCN = aggregate(cbind(d15N, d13C) ~ NumericDate + Site.ID + Endmember + Watershed, data = SepCNfinal, mean)

SepCNH = merge(agCN, SepHfinal, by=c("Endmember","Site.ID","NumericDate"), all.y = TRUE)

SepCNH = read.csv("C:/Users/Julie Kelso/Dropbox/iUtah/biweekly sampling/iUTAH proj/iUTAH/iUtahRepositoryIsotopes/iUTAH/SepCNH.csv")

### substituting April CN values for Sep CN values of 5400
SepCNH$d13C[SepCNH$Site.ID == "5400"] <- "-25.86"
SepCNH$d15N[SepCNH$Site.ID == "5400"] <- "9.95"

### substituting Sep 2-13 CN values for Sep 2014 CN values of 5400
SepCNH$d13C[SepCNH$Site.ID == "Cudahy"] <- "-20.96"
SepCNH$d15N[SepCNH$Site.ID == "Cudahy"] <- "8.34"

### sort ####
SepCNH =  SepCNH[order(SepCNH$Endmember, SepCNH$Watershed.y), ] 
write.csv(SepCNH, "SepCNH2.csv")

SepCNH2 = read.csv("C:/Users/Julie Kelso/Dropbox/iUtah/biweekly sampling/iUTAH proj/iUTAH/iUtahRepositoryIsotopes/iUTAH/SepCNH2.csv")

nit = read.csv("C:/Users/Julie Kelso/Dropbox/All Isotopes/iUtahRespository/Nitrate Sample ID Sheet.csv", stringsAsFactors = FALSE)

colnames(nit)[c(5,6,8)] <- c("d15Nit", "d18ONit", "NumericDate")
nit = nit[,c(1:8)]

nitag = aggregate(cbind(d15Nit, d18ONit) ~ NumericDate + SiteID + Watershed, data = nit, mean)

#### I made this in excel from SepCNH2 and C:\Users\Julie Kelso\Dropbox\All Isotopes\iUtahRespository\iUtahRepositoryHydr  ########

final = read.csv("C:/Users/Julie Kelso/Dropbox/iUtah/biweekly sampling/iUTAH proj/iUTAH/iUtahRepositoryIsotopes/iUTAH/FinalRepository.csv")

all = merge(nitag, final, by=c("SiteID","NumericDate"), all.y = TRUE)

all =  all[order(all$OM_SizeClass, all$Watershed.x, all$NumericDate), ] 

write.csv(all, "all.csv")

DIC = read.csv("C:/Users/Julie Kelso/Dropbox/All Isotopes/iUtahRespository/DICSepNov2014.csv", stringsAsFactors = FALSE)

colnames(DIC)[c(2,3,8)] <- c("d13DIC", "mgCperml", "NumericDate")

DICag = aggregate(d13DIC ~ NumericDate + SiteID + Watershed, data = DIC, mean)

DICag = DICag[,c(1,2,4)]

all2 = merge(DICag, all, by=c("SiteID","NumericDate"), all.y = TRUE)

all2 =  all2[order(all2$OM_SizeClass, all2$Watershed.x, all2$NumericDate), ] 

#### adding values missing from Nov based on Dec #### BAD ###########################3
all2$d13DIC[all2$SiteID == "LR_CanalGarff" & all2$NumericDate == "141120" ] <- "-8.39"
all2$d13DIC[all2$SiteID == "RB_KF_BA" & all2$NumericDate == "141118" ] <- "-9.59"

write.csv(all2, "all2.csv")

