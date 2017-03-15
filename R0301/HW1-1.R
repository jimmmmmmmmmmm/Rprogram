rm(list = ls(all=TRUE))

rawData=read.csv('chickenpig.csv',header = TRUE)
for(yid in c(1:length(rawData[,1])))
{
  barplot(as.matrix(rawData[yid,c(-1,-1)]),
          main=paste0("The relation between Meat and Feed of Chicken and Pigs in ",rawData[yid,1]," in 2016"))
}

library(plotly)
trace_0 <- rawData$ChickenPrice...kg.
trace_1 <- rawData$C.FeedPrice...kg.
trace_2 <- rawData$PigPrice...kg.
trace_3 = rawData$P.FeedPrice...kg.
x <- c(1:12)

data <- data.frame(x, trace_0, trace_1, trace_2, trace_3)

p <- plot_ly(data, x = ~x, y = ~trace_0, name = 'trace 0', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~trace_1, name = 'trace 1', mode = 'lines+markers') %>%
  add_trace(y = ~trace_2, name = 'trace 2', mode = 'lines+markers') %>%
  add_trace(y = ~trace_3, name = 'trace 1', mode = 'lines+markers')
chart_link = plotly_POST(p, filename="line/mode1")
chart_link
htmlwidgets::saveWidget(p,"test.html")
