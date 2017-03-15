library(httr)
library(XML)
subURL = 'https://www.ptt.cc/bbs/movie/index'
startid = 1000
endid = 1010

for(pid in seq(startid,endid))
{
  url = paste0(subURL,pid,'.html')
  data = GET(url)
  rawData = htmlParse(content(data))
  print(rawData)
}
