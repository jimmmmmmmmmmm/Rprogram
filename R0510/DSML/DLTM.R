rm(list=ls(all.names = TRUE))
source('MLDM.R')
library(devtools)
install_github("ggbiplot", "vqv")
library(scales)
library(grid)
library(ggbiplot)

testTfidf = doc.tfidf
tfidf.pca <- prcomp(testTfidf)
tfidf.kmeans <- as.factor(kmeansOut$cluster)

#par(family=("Heiti TC Light"))
g <- ggbiplot(tfidf.pca, obs.scale = 1, var.scale = 1, 
              groups = tfidf.kmeans, ellipse = TRUE, 
              circle = TRUE, labels = rownames(testTfidf))
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal', 
               legend.position = 'top')
print(g)