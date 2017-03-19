rm(list = ls(all=TRUE))
rawData=read.csv('HW1Transactions.csv',header = TRUE)
for(yid in c(1:length(rawData[,1])))
{
  barplot(as.matrix(rawData[yid,c(-1,-1)]),
          main=paste0("The Transactions of WhiteChicken,Chicken and Pigs",
                      " in ",rawData[yid,1],",2015"))
}

library(plotly)
trace_0 <- rawData$W.Chicken
trace_1 <- rawData$Chicken
trace_2 <- rawData$Pigs
x <- c(1:12)

data <- data.frame(x, trace_0, trace_1, trace_2)

p <- plot_ly(data, x = ~x, y = ~trace_0, name = 'White Chicken Transactions', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~trace_1, name = 'Chicken Transactions*1/3', mode = 'lines+markers') %>%
  add_trace(y = ~trace_2, name = 'Pigs Transactions', mode = 'lines+markers') 

htmlwidgets::saveWidget(p,"HW1plotely.html")