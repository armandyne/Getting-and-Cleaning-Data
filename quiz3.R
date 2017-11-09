workdir<-"D:/coursera/Getting and Cleaning Data"
if(getwd() != workdir) {
     setwd(workdir)
}

# question 1

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/hid.csv")

data <- read.csv("./data/hid.csv")
head(data)
head(data$ACR)
agricultureLogical<-data$ACR==3 & data$AGS == 6
which(agricultureLogical)[1:3]

# question 2

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl, destfile = "./data/jeff.jpg", mode = "wb")
library(jpeg)
jpeg.data<-readJPEG("./data/jeff.jpg", native = TRUE)
quantile(jpeg.data, probs = c(0.3,0.8))

# question 3
library(data.table)
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile = "./data/GDP.csv")
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl, destfile = "./data/STATS_Country.csv")

dt1 <- data.table(read.csv("./data/GDP.csv", sep = ",", skip = 4, nrows = 215))
dt2 <- data.table(read.csv("./data/STATS_Country.csv"))
head(dt1,2)
head(dt2,2)
dt1 <- dt1[(X!="" & !is.na(X.1)),list(X, X.1, X.3, X.4)]
setnames(dt1, "X", "CountryCode")
res <- merged[!is.na(merged$X.1),]
length(unique(res$X.1))
merged[order(X.1, decreasing = TRUE),c(1,2,3)][13]


