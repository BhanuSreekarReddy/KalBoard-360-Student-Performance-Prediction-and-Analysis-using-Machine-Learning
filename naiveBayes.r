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
# building the model NAIVE BAYES
modelnb <- train(Grade~.,data=kaldata,trControl=trainctrl, method="nb",preProcess= c("center","scale"),tuneLength=10)
print(modelnb)
# Parameter Tuning or Hyperparameter optimization
#grid search
nbGrid <- data.frame(fL=c(0,0.01,0.05,0.1,0.25,0.5,0.75,1,1.25,1.5,1.75,2,5), usekernel = TRUE, adjust=c(0,0.01,0.05,0.1,0.25,0.5,0.75,1,1.25,1.5,1.75,2,5))
modelnbgrid <- train(Grade~.,data = kaldata, method="nb",trControl=trainctrl,tuneGrid=nbGrid,tuneLength=10)
print(modelnbgrid)
# plotting the output of parameter tuning
plot(modelnbgrid,type='h')
