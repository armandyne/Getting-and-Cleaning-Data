setwd("D:\\coursera\\Getting and Cleaning Data\\")

if(!file.exists("./data/pid.csv")){
     download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",destfile = "./data/pid.csv")
}

acs<-data.table(read.csv("./data/pid.csv"))
library(sqldf)
result<-sqldf("select pwgtp1 from acs where AGEP < 50")
result2<-sqldf("select distinct AGEP from acs")