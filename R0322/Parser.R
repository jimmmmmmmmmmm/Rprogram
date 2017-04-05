rm(list=ls(all.names=TRUE))
library(XML)
library(Rcurl)
library(httr)

urlPath <- "https://www.ptt.cc/bbs/movie/index.html"
temp    <- getURL(urlPath, encoding = "big5")
xmldoc  <- htmlParse(temp)
title   <- xpathSApply(xmldoc, "//div[@class=\"title\"]", xmlValue) # \"__\"跳脫字元
title   <- gsub("\n", "", title) #去掉n跟t
title   <- gsub("\t", "", title)
emptyId=which(title=="(本文已被刪除)[brukling]")
title=title[-emptyId]
author  <- xpathSApply(xmldoc, "//div[@class='author']", xmlValue)
empty=author=="_"
author=author[!empty]
date    <- xpathSApply(xmldoc, "//div[@class='date']", xmlValue)
date    <- date[-emptyId]
response<- xpathSApply(xmldoc, "//div[@class='nrec']", xmlValue)
response<- response[-emptyId]
path    <- xpathSApply(xmldoc, "//div[@class='title']/a//@href")
alldata <- data.frame(title, author, path, date, response)


#title[title=="(本文已被刪除)[brukling]"],將出現的TRUE的行數刪除
