setwd("D:\\coursera\\Getting and Cleaning Data\\")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",destfile = "./data/wksst8110.for")
df <- read.fwf(file="./data/wksst8110.for",widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
sum(df[,4])