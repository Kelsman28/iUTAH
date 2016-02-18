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

setwd("C:/Users/Julie Kelso/Dropbox/All Isotopes/iUtahRespository")

SepCN = read.csv("C:/Users/Julie Kelso/Dropbox/All Isotopes/iUtahRespository/SepCN.csv")
SepH = read.csv("C:/Users/Julie Kelso/Dropbox/All Isotopes/iUtahRespository/SepH.csv")

colnames(SepH)[c(1,9,10,14)] <- c("SampleID","dD", "PerH", "NumericDate")
myvars <- c("SampleID" , "dD","PerH","Comments","Sample.ID","Description",
            "NumericDate","Month","Watershed","Site.ID","TrayName")
SepH <- SepH[myvars]

SepH$NumericDate = replace(SepH$NumericDate, 
SepCN$NumericDate[SepCN$Site.ID == "LR_HWY252"] <- "140913"
LR_HWY252  should be 140913 but is 140915
LR_HWY252
