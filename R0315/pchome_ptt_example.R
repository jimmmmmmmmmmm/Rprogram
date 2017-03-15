#install.packages("httr")
library(httr)
#install.packages('XML')
library(XML)

subURL='https://www.ptt.cc/bbs/movie/index'
startid=1000
endid=1010
for(pid in seq(startid,endid))
{
  url=paste0(subURL,pid,'.html')
  #print(url)
  data=GET(url)
  rawData=htmlParse(content(data))  #jason不用＋htmlParse,XML(ptt)要
  print(rawData)
}