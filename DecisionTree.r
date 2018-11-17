# installing the required package "CARET" and "rpart.plot"
install.packages("caret")
install.packages("rpart.plot")
# to know the present working directory
getwd() 
# set the working directory to the path where the data is present
setwd("C:/Users/Bhanu/Documents/NCSU academic course materials/Educational Data Mining/Project/Final project report slides and code")
# read the data
kaldata <- read.csv("xAPI-Edu-Data.csv")
#load the caret package
library(caret)
# defining the training method that is repeated cross validation with 10 folds repeated 3 times
trainctrl <- trainControl(method = "repeatedcv", number=10,repeats = 3)
# loading the package rpart.plot
library(rpart.plot)
# building the model Decision tree and tuning parameters
modeldtree<- train(Grade~.,data=kaldata,method="rpart",parms=list(split="information"),trControl=trainctrl,tuneLength=10)
print(modeldtree)

#plotting the parameter tuning output
plot(modeldtree)