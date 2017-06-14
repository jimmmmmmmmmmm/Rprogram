rm(list=ls(all.names=TRUE))
library(plotly)
rawData=read.csv('beforeafter.csv',header = TRUE)

PM2.5 <- rawData$before.2013.
trace_1 <- rawData$after.2014.
Month <- c(1:12)

data <- data.frame(Month, PM2.5, trace_1)

p <- plot_ly(data, x = ~Month, y = ~PM2.5, name = 'before(2013)', type = 'scatter', 
             mode = 'lines+markers') %>%
   add_trace(y = ~trace_1, name = 'after(2014)', mode = 'lines+markers')
p

htmlwidgets::saveWidget(p,"beforeafter.html")

  #  "xaxis":{
  #          tickvals:["August","September","Octobor","November","December","January",
  #         "February","March","April","May","June","July"]
  #}