source('D:/coursera/Getting and Cleaning Data/instruction.R')
# 1
ds<-read.csv(file.Path)
idx<-!is.na(ds$VAL) & ds$VAL==24
sum(idx)
# ---------------------------------

library(xlsx)
dat<-read.xlsx("./data/NGAP.xlsx",sheetIndex = 1,rowIndex = 18:23,colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)

#--------------------------------------
xmlUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(xmlUrl,"./data/restaurants.xml")

library(XML)
doc<-xmlTreeParse("./data/restaurants.xml",useInternal=TRUE)
rootNode<-xmlRoot(doc)
length(xpathSApply(doc,"//row[zipcode=21231]",xmlValue))

#--------------
library(data.table)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv","./data/pid.csv")
DT<-fread("./data/pid.csv")
