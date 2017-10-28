setwd("D:\\coursera\\Getting and Cleaning Data\\")
library(httr)
library(jsonlite)
myapp <- oauth_app("github",
                   key = "38cb24ab5c1a462e5c10",
                   secret = "8dc7f55b4bca0e7e56750a8a68ce4e51156e6ee3")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

jsonData<-fromJSON(content(req,type="text"))
jsonData[jsonData$name=="datasharing","created_at"]