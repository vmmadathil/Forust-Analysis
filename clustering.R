
#Developed for Forust.io
#  Script for k-means clustering to determine if an organizaion meets financial standards
#  Author:Visakh Madathil

library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering algorithms & visualization

set.seed(20)
row.names(avgdataZNorm) <- c("1001","1002", "1003", "1004", "1005", "1006", "1007")
avgdataZNorm$OrgID <- NULL

#calculating Euclidean  distance 
distance <- get_dist(avgdataZNorm)

#A simple visualization of the distances
fviz_dist(distance, gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))

avgdataZNorm[is.nan(avgdataZNorm)] <- 0

cluster <- kmeans(avgdataZNorm, centers = 2, nstart = 25)

cluster