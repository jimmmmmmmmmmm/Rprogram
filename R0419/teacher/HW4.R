rm(list=ls(all.names = TRUE))
library(ggplot2)
library(plotly)
require(stats)
#1998-2015各年度我國學生赴主要留學國家留學簽證人數統計表
rawdata = read.csv('studyabroad.csv',
                   header = TRUE)
#delId = which(is.na(rawdata$France) == TRUE)
#rawdata = rawdata[-delId,]
#rawdata[is.na(rawdata)] = 0
lastyearId = length(rawdata$year)
firstYear = rawdata$year[1]
lastYear = rawdata$year[lastyearId]
n = lastYear - firstYear + 1
allType = names(rawdata)
rownames(rawdata) <- 1:nrow(rawdata)

#敘述統計
summary(rawdata)

#留學生去歐洲情況
cor.test(rawdata$France,rawdata$Germany)

#留學生去歐美的選擇
cor.test(rawdata$American,rawdata$U.K)

#1998-2015整體變化情況
typeId = c(2:9)
newTable = data.frame()
for( nid in c(1:n) )
{
  year = as.matrix(rep(rawdata$year[nid], length(rawdata[nid,typeId])))
  people = as.matrix(as.numeric(rawdata[nid,typeId]))
  type = as.matrix(as.character(allType[typeId]))
  temp = cbind(year, log(people), type)
  newTable = rbind(newTable, temp)
}
names(newTable) = c('year', 'people', 'country')
newTable = newTable[with(newTable, order(country)),]
rownames(newTable) <- 1:nrow(newTable)

p <- plot_ly(data = newTable, x = ~year, 
             y = ~people, color = ~country) %>%
  add_lines( yaxis = list(range = c(0,10)))
p
htmlwidgets::saveWidget(p, "index.html")