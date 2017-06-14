dat <- data.frame(
  time = factor(c("Lunch","Dinner"), 
  levels = c("Lunch","Dinner")),
  total_bill = c(14.89, 17.23))
library(ggplot2)
# stat表明取用樣本點對應縱軸值
ggplot(data=dat, aes(x=time, y=total_bill, fill=time)) +
  geom_bar(stat="identity")

raw = diamonds
head(raw)

ggplot(data = diamonds, aes(x = cut)) +
  geom_bar(fill = "lightblue") +
  facet_wrap(~color)

raw = airquality
ggplot(data=airquality) + 
  geom_point(aes(x=Temp, y=Ozone, 
                 color=Month))

ggplot(diamonds, aes(clarity, fill=cut)) +
  geom_bar(position="fill")

ggplot(diamonds, aes(x = clarity, y =depth)) +
geom_boxplot() 

ggplot(diamonds, aes(carat, price)) +
  stat_bin2d(bins = 25, colour = "white") +
  coord_cartesian(xlim = c(0, 1)) +
  theme_minimal()
