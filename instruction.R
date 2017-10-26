setwd("D:\\coursera\\Getting and Cleaning Data\\")

data.Dir<-"./data"
file.Name<-"NGAP.xlsx"
urlFile<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"     
file.Path <-paste(data.Dir,"/",file.Name,sep = "")

if(!file.exists(data.Dir)){
     dir.create("data")
}

if(!file.exists(file.Path)) {
     download.file(urlFile, destfile = file.Path)
     list.files(data.Dir)
     dateDownload <- date()
     dateDownload
} else {
     print("Already exists.")
}