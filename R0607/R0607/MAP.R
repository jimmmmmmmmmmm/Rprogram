rm(list = ls(all=TRUE))
devtools::install_github("hadley/ggplot2@v2.2.0")
devtools::install_github("dkahle/ggmap")

library(ggplot2)
library(ggmap)
library(mapproj)


map=get_map(location = "Taiwan",zoom = 9,language = "zh-TW")
map=get_map(location = c(lan=120.233937,lat=22.993013),zoom=10,language = "zh-TW")

uv=read.csv("UV_data1.csv")
uv$lon <- uv$WGS84Lon
uv$lat <- uv$WGS84Lat

legend <- theme(legend.justification=c(0,0), legend.position=c(0,0)
                , legend.margin=unit(0,"lines"), legend.box="vertical"
                , legend.key.size=unit(1,"lines"), legend.text.align=0
                , legend.title.align=0)

map <- get_map(location = 'Taiwan', zoom = 7,maptype = "terrain-lines")
ggmap(map) + geom_point(aes(x = lon, y = lat, size = UVI), data = uv) +
scale_size(range=c(0,3))

d <- function(x=-95.36, y=29.76, n,r,a ){
  round(data.frame(
    lon = jitter(rep(x,n), amount = a),
    lat = jitter(rep(y,n), amount = a)
  ), digits = r)
}

df <- d(n = 50,r = 3,a = .3) # random 製造經緯度
map <- get_googlemap(markers = df, path = df,, scale = 2)
ggmap(map)

df2 <- uv[,5:6]
names(df2) <- c('lon', 'lat')
map2 <- get_googlemap(center = 'Taiwan', zoom = 7,
                      markers = df2, path = df2, scale = 2)
ggmap(map2)
mu <- c(-95.3632715, 29.7632836)
nDataSets <- sample(4:10,1)
chkpts <- NULL
for(k in 1:nDataSets){
  a <- rnorm(2); b <- rnorm(2);
  si <- 1/3000 * (outer(a,a) + outer(b,b))
  chkpts <- rbind(chkpts,
                  cbind(MASS::mvrnorm(rpois(1,50), jitter(mu, .01), si), k))
}
chkpts <- data.frame(chkpts)
names(chkpts) <- c("lon", "lat","class")
chkpts$class <- factor(chkpts$class)
qplot(lon, lat, data = chkpts, colour = class)
df2$uv <- as.factor(as.integer(uv$UVI))
qplot(lon, lat, data = df2, colour = uv)

df2$air <- sample(1:10, length(df2$uv), replace=T) 
ggmap(get_map(location = 'taiwan', zoom = 7), extent = "panel") +
  geom_point(aes(x = lon, y = lat, colour = factor(uv), size = air), data = df2) +
  scale_size(range = c(0, 6))



