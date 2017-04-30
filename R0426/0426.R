rm(list = ls(all=TRUE))
library(NLP)
library(tm)
library(jiebaRD)
library(jiebaR)
library(RColorBrewer)
library(wordcloud)
library(rvest)
library(tmcn)
library(xml2)
URL="https://www.ptt.cc/bbs/NTUcourse/index.html"
html=read_html(URL)
title=html_nodes(html,"a")
href=html_attr(title,"href")
data=data.frame(title=toUTF8(html_text(title)),
                href=href)

data = data[-c(1:10),]
getContent=function(href)
{
  subURL=paste0("https://www.ptt.cc",href)
  subhtml=read_html(subURL)
  content=html_nodes(subhtml,"div#main-content.bbs-screen")
  return(toUTF8(html_text(content)))
}
#getContent(data$href[1])
allText = sapply(data$href, getContent) 
#sapply把抓出來的資料都倒進allText
#allText
write.table(allText, "mydata.txt")



