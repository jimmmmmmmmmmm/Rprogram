source('pttTestFunctionHW5.R')
id = c(1:6)
URL = paste0("https://www.ptt.cc/bbs/travel/index", id, ".html")
filename = paste0(id, ".txt")
pttTestFunctionHW5(URL[1], filename[1])
mapply(pttTestFunctionHW5, 
       URL = URL, filename = filename)