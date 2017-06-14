rm(list=ls(all.names=TRUE))
library(plotly)
rawData=read.csv('beforeafter.csv',header = TRUE)

PM2.5 <- rawData$before.2013.
trace_1 <- rawData$after.2014.

data <- data.frame(x=c("August","September","Octobor","November","December","January",
                       "February","March","April","May","June","July"), PM2.5, trace_1)
data$x<-factor(data$x,levels=c("August","September","Octobor","November","December","January",
                               "February","March","April","May","June","July"))

p <- plot_ly(data, x = ~x, y = ~PM2.5, name = 'before(2013-2014)', type = 'scatter', 
             mode = 'lines+markers') %>%
   add_trace(y = ~trace_1, name = 'after(2014-2015)', mode = 'lines+markers') 
p



   