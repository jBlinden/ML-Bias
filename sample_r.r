source("http://bioconductor.org/biocLite.R")
#install.packages('NeuralNetTools',repos = "http://cran.us.r-project.org")
#Add this if you need to install neural network tools ^

args <- commandArgs(TRUE)

input_weights_file <-args[1]
input_struct_file <-args[2]


library(NeuralNetTools)
library(rhdf5)
data(neuraldat)

#mydata <- h5read("myModel.hdf5","dense_37")
#print(h5ls("myModel.hdf5"))
#str(mydata)

library(nnet)
#mod <- nnet(Y1 ~ X1 + X2 + X3, data = neuraldat, size = 10)
#print(mod)
#paste(second_model,collapse=" ")
my_weights <- c(scan(input_weights_file,double(),sep=","))
#paste(my_weights, collapse=" ")
wts_in <- my_weights


struct <- c(scan(input_struct_file,integer(),sep=","))
plotnet(wts_in,struct)

olden(wts_in,struct)
lekprofile(wts_in,struct)
