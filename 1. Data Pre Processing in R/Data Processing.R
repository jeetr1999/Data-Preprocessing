#-----------------------Get The Data Set-----------------------
dataset <- read.csv("data.csv")

#-----------------------Taking Care of Missing Data-----------------------
#We can either remove the missing data or 
#we can take the mean of the columns and replace the missing data with the same

dataset$Age <- ifelse(is.na(dataset$Age),
                      ave(dataset$Age, FUN = function(x) mean(x, na.rm = T)),
                      dataset$Age) 

#The second condition function is used to indicate to include the missing values 
#when going through the columns while calculating the mean
#And the last condition is what happens when the row doesn't have a missing data

#Doing the same for salary
dataset$Salary <- ifelse(is.na(dataset$Salary),
                      ave(dataset$Salary, FUN = function(x) mean(x, na.rm = T)),
                      dataset$Salary) 

#-----------------------Encoding Categorical Data-----------------------
"Since ML models are based on mathematical equations, having categorical variables
would be quite problematic for the equations
And that is why we need to encode the categorical variables into numbers
We will use factors function and it will transform the categorical variables
into numeric categories and will see them as factors, and we will also be able 
to use lables for each category"

dataset$Country <- factor(dataset$Country,
                          levels = c('France', 'Spain', 'Germany'),
                          labels = c(1, 2, 3))

#Same for the purchase column
dataset$Purchased <- factor(dataset$Purchased,
                            levels = c('Yes', 'No'),
                            labels = c(1, 0))

#---------------Splitting The Data into Training and Testing Set--------------#
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, 0.8)
split

training_set = subset(dataset, split == T)
test_set = subset(dataset, split == F)

training_set
test_set

#------------------------------Feature Scaling--------------------------------
training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])
