# Developed for Forust.io
# A script to assist in IV Determination for Non Profit Finanical Sustainability
# Author: Visakh Madathil
#Ensure that the data set is prepped for factors

library(randomForest)

row.names(dataZNorm) <- c("1001","1002", "1003", "1004", "1005", "1006", "1007")
dataZNorm$OrgID <- NULL

#custom function for NAN replacement
is.nan.data.frame <- function(x){
 do.call(cbind, lapply(x, is.nan))
 }

#replacing N/A and NANvalues with 0
dataZNorm[is.na(dataZNorm)] <- 0 
dataZNorm[is.nan(dataZNorm)] <- 0 

model <- randomForest(Label ~ ., data = dataZNorm)

model

varImpPlot(model)