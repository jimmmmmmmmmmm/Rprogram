rm(list = ls(all=TRUE))   #清理資料
library(png)
library(animation)
ani.options("convert")

rawData=read.csv('StudentNumber1945-2015.csv',header = TRUE)
rawData=rawData[,-72]
allLine=length(rawData[,1]) #看有幾個raw
rawData=rawData[-allLine,]  #刪掉上一行
year=rawData$年度    #yearId=rawData[,1]

saveGIF(
for(yid in c(1:nrow(rawData)))
{
  barplot(as.matrix(rawData[yid,c(-1,-2)]),
          main=paste0("國立台灣大學",rawData[yid,1],
                      "年大學部總計",rawData[yid,2],"人"))
},movie.name = "student.gif",
  interval=0.3,
  ani.width=1500,
  ani.height=600
)

#img.src=連結
#ifriend.src

# Sys.getlocale(category = 'LC_ALL') 檢查編碼

