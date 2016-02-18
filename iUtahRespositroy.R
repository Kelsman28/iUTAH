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
df$question[df$variable %in% c("var2", "var3", "var4")] <- "text"
d
SepCN$Date[SepCN$Reach %in% c("RB_1300E","RB_1300S","RB_ARBR_AA","RB_CG_BA","RB_FD_AA" , 
                              "RB_KF_BA" ,"RB_RBG_BA","RB_TM")] = "140901"



           