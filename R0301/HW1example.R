rm(list = ls(all=TRUE))

rawData=read.csv('NTUteacher1950-2015.csv',header = TRUE)
allLine=length(rawData[,1])
rawData=rawData[-allLine,]
allLine2=length(rawData[1,])
rawData=rawData[,-allLine2]

for(yid in c(1:length(rawData[,1])))
{
  barplot(as.matrix(rawData[yid,c(-1,-2)]),
          main=paste0("National Taiwan Universary",rawData[yid,1],"年各學院專任教師人數總計",rawData[yid,2],"人"))
}