rm(list=ls(all.names=TRUE))
library(XML)
library(RCurl)
library(httr)

urlPath <- "http://m.appledaily.com.tw/realtimenews/section/finance"
temp    <- getURL(urlPath, encoding = "big5")
xmldoc  <- htmlParse(temp)
title   <- xpathSApply(xmldoc, "//span[@class=\"art-title-text\"]", xmlValue)
title
time   <- xpathSApply(xmldoc, "//span[@class=\"time\"]", xmlValue)
time
views<- xpathSApply(xmldoc, "//span[@class=\"views\"]", xmlValue)
views
alldata <- data.frame(title, time, views)

write.table(alldata, "pttmovie.csv")

library(knitr)
data = read.table("pttmovie.csv")
kable(data)
