plotPower <- function(buildingsPower)
{
  library(ggplot2)
  #load("./powerIndex/R/power.RData")  
  #id = c(1,2,5)
  #buildingsPower = power[1:24,id]
  ggplot(data=buildingsPower, 
         aes(x=buildingsPower[,2], 
             y=buildingsPower[,3], group=1)) +
    geom_line()
}
