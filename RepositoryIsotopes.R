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

# setwd - went to session, set working directory to project working directory

SepCN = read.csv("C:/Users/Julie Kelso/Dropbox/All Isotopes/iUtahRespository/SepCN.csv")
SepH = read.csv("C:/Users/Julie Kelso/Dropbox/All Isotopes/iUtahRespository/SepH.csv")
