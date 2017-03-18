rm(list = ls(all=TRUE))

rawData=read.csv('HW1Transactions.csv',header = TRUE)
for(yid in c(1:length(rawData[,1])))
{
  barplot(as.matrix(rawData[yid,c(-1,-1)]),
          main=paste0("The relation among Transactions of White Chicken, Chicken and Pigs in ",rawData[yid,1]," in 2015"))
}

library(plotly)
trace_0 <- rawData$W.Chicken_Transactions
trace_1 <- rawData$Chicken_Transactions.1.3
trace_2 <- rawData$Pigs_Transactions
x <- c(1:12)

data <- data.frame(x, trace_0, trace_1, trace_2)

p <- plot_ly(data, x = ~x, y = ~trace_0, name = 'White Chicken Transaction', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~trace_1, name = 'trace 1', mode = 'lines+markers') %>%
  add_trace(y = ~trace_2, name = 'trace 2', mode = 'lines+markers') %>%
  add_trace(y = ~trace_3, name = 'trace 1', mode = 'lines+markers')
#chart_link = plotly_POST(p, filename="line/mode1")
#chart_link
htmlwidgets::saveWidget(p,"test.html")
