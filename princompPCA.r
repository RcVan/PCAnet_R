#######################################
###         NML homework 5          ###
###          princompPCA.r          ###
###           Ian, Fan              ###
###          2019.02.24             ###
#######################################

## clear variables and set work directory
# rm(list = ls())
# setwd("/Users/rcusf/Desktop/NMLh5")


# source
source('loadData.r')


sd = 1024
set.seed(sd)
########################################

## get target data
data = trainData[,c(1:4)]
row_num = nrow(trainData)


## data preprocess
data_mean = apply(data, 2, mean)
zero_mean_data = t( t(data) - data_mean )
# check
# data_mean2 = apply(zero_mean_data, 2, mean)



## PCA 
pca_data = princomp(zero_mean_data)
summary(pca_data, loadings = TRUE)
eigen_matrix = matrix(loadings(pca_data), nrow = 4)
colnames(eigen_matrix) = c("Comp1", "Comp2", "Comp3", "Comp4")
rownames(eigen_matrix) = c("Sep_L", "Sep_W", "Pet_L", "Pet_W")



## get eigenvalues and eigenvector
# cor_matrix = cor(zero_mean_data)
# data_eigen = eigen(cor_matrix)
# eigenvalue = data_eigen$values
# eigenvector = data_eigen$vectors
# check eigenvector
# eigenvector %*% solve(eigenvector)




