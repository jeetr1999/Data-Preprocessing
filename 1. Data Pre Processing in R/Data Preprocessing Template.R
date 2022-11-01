#importing the dataset
dataset = read.csv("Data.csv")
dataset = dataset[, 2:3]

#Splitting dataset
library(caTools)
set.seed(1)
split = sample.split(dataset$Purchased, SplitRatio =  0.8)
split
training_set = subset(dataset, split == T)
test_set = subset(dataset, split == F)

#Feature scaling
# training_set[-c(1,4)] = scale(training_set[-c(1,4)])
# test_set[c(2,3)] = scale(test_set[c(2,3)])


