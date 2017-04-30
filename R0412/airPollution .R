rm(list = ls(all=TRUE))
library(dplyr)
rawdata = read.csv(
  'AQXDaily_20170409211519.csv',
  encoding = 'UTF-8',
  header = T)
errorId = grep('觀音', rawdata$SiteName)
errorData = rawdata[errorId,]
rawdata = rawdata[-errorId,]
errorData[,4:9] = errorData[,3:8]
errorData[,3] = errorData[,2]
errorData[,3] = gsub('觀音,', "", errorData[,3])
errorData[,2] = gsub('[0-9]', "", errorData[,2])
errorData[,2] = gsub(',--', "", errorData[,2])

rawdata = rbind(rawdata, errorData)

df <- rawdata %>% group_by(SiteName)
result = summarise(df, mean(SO2SubIndex), mean(COSubIndex))

dfDate <- rawdata %>% group_by(MonitorDate)
result2 = dfDate %>% filter(SO2SubIndex  > 10)

SO2 <- result2 %>% group_by(SiteName)
result3 <- summarise(SO2)
