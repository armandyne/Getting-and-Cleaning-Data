workdir<-"D:/coursera/Getting and Cleaning Data"
if(getwd() != workdir) {
     setwd(workdir)
}

# fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
# download.file(fileUrl, destfile = "./data/hid.csv")
# 
# ds<-read.csv("./data/hid.csv")
# strsplit(names(ds), "wgtp")[[123]]
#----------------

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile = "./data/gdp.csv")

ds<-read.csv("./data/gdp.csv",skip = 4, nrows = 215, stringsAsFactors = FALSE)
head(ds)
gdp<-as.numeric(gsub(",","",ds$X.4[1:190]))
mean(gdp)
#----------------
countryNames <- ds$X.3[1:190]
length(grep("^United",countryNames))

#----------------
library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
addmargins(table(year(sampleTimes), weekdays(sampleTimes)))
