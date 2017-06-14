#install.packages("ggplot2")
library(ggplot2)
df <- data.frame(c("D0.5", "D1", "D2"),
                 c(4.2, 10, 29.5))
names(df) <- c("dose", "len")
head(df)
# Basic line plot with points
ggplot(data=df, aes(x=dose, y=len, group=1)) +
  geom_line()+
  geom_point()
# Change the line type
ggplot(data=df, aes(x=dose, y=len, group=1)) +
  geom_line(linetype = "dashed")+
  geom_point()
# Change the color
ggplot(data=df, aes(x=dose, y=len, group=1)) +
  geom_line(color="red")+
  geom_point()

library(grid)
# Add an arrow
ggplot(data=df, aes(x=dose, y=len, group=1)) +
  geom_line(arrow = arrow())+
  geom_point()
# Add a closed arrow to the end of the line
myarrow=arrow(angle = 15, 
              ends = "both", 
              type = "closed")
ggplot(data=df, aes(x=dose, y=len, group=1)) +
  geom_line(arrow=myarrow)+
  geom_point()

df2 <- data.frame(supp=rep(c("VC", "OJ"), each=3),
                  dose=rep(c("D0.5", "D1", "D2"),2),
                  len=c(6.8, 15, 33, 4.2, 10, 29.5))
head(df2)
ggplot(data=df2, aes(x=dose, y=len, group=supp)) +
  geom_line()+
  geom_point()

ggplot(data=df2, aes(x=dose, y=len, group=supp)) +
  geom_line(linetype="dashed", color="blue", size=1.2)+
  geom_point(color="red", size=3)

ggplot(df2, aes(x=dose, y=len, group=supp)) +
  geom_line(aes(linetype=supp))+
  geom_point()

ggplot(df2, aes(x=dose, y=len, group=supp)) +
  geom_line(aes(linetype=supp)) +
  geom_point()

ggplot(df2, aes(x=dose, y=len, group=supp)) + geom_line(aes(linetype=supp)) + geom_point(aes(shape=supp))

ggplot(df2, aes(x=dose, y=len, group=supp)) +
  geom_line(aes(linetype=supp)) +
  geom_point()+
  scale_linetype_manual(values=c("twodash", "dotted"))

ggplot(df2, aes(x=dose, y=len, group=supp)) +
  geom_line(aes(color=supp)) +
  geom_point(aes(color=supp))
