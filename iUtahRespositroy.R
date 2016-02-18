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



SepCN = read.csv("C:/Users/Julie Kelso/Dropbox/All Isotopes/iUtahRespository/SepCN.csv")
SepH = read.csv("C:/Users/Julie Kelso/Dropbox/All Isotopes/iUtahRespository/SepH.csv")

colnames(SepH)[c(1,9,10,14)] <- c("SampleID","dD", "PerH", "NumericDate")

### reduce SepH to columns listed in myvars
myvars <- c("SampleID" , "dD","PerH","Comments","Sample.ID","Description",
            "NumericDate","Month","Watershed","Site.ID","TrayName")
SepH <- SepH[myvars]

#LR_HWY252  should be 140913 but is 140915
SepCN$NumericDate[SepCN$Reach == "LR_HWY252"] <- "140913"
