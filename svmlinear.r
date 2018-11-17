# installing the required package "CARET"
install.packages("caret")
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
# building the model SVM linear
modeldev <- train(Grade~.,data=kaldata,trControl=trainctrl, method="svmLinear",preProcess= c("center","scale"),tuneLength=10)
print(modeldev)
# Parameter Tuning or Hyperparameter optimization
#grid search
grid11 <- expand.grid(C = c(0,0.01,0.05,0.1,0.25,0.5,0.75,1,1.25,1.5,1.75,2,5))
set.seed(20)
modeldevgrid <- train(Grade~.,data = kaldata,method="svmLinear",trControl=trainctrl, preProcess=c("center", "scale"),tuneGrid = grid11, tuneLength = 10)
print(modeldevgrid)
#plotting the parameter tuning output
plot(modeldevgrid)