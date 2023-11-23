## MILESTONE 1 ##

library(readr)
loan_dataset <- read_csv("Data/loan_dataset.csv")
View(loan_dataset)

#install packages
if (!is.element("renv", installed.packages()[, 1])) {
  install.packages("renv", dependencies = TRUE)
}
require("renv")
renv::init()
renv::restore()
renv::init()


if (!is.element("languageserver", installed.packages()[, 1])) {
  install.packages("languageserver", dependencies = TRUE)
}
require("languageserver")



if (!is.element("mlbench", installed.packages()[, 1])) {
  install.packages("mlbench", dependencies = TRUE)
}
require("mlbench")

#preview dataset 
dim(loan_dataset)
#data types
sapply(loan_dataset, class)

#Measure of frequency 

loan_dataset_freq <- loan_dataset$education
cbind(frequency = table(loan_dataset_freq),
      percentage = prop.table(table(loan_dataset_freq)) * 100)

#Measure of central tendency

loan_dataset_loan_amount_mode <- names(table(loan_dataset$loan_amount))[
  which(table(loan_dataset$loan_amount) == max(table(loan_dataset$loan_amount)))
]
print(loan_dataset_loan_amount_mode)

#Measure of distribution
#SD
sapply(loan_dataset[, 5:12], sd)
#variance
sapply(loan_dataset[, 5:12], var)
#kurtosis
if (!is.element("e1071", installed.packages()[, 1])) {
  install.packages("e1071", dependencies = TRUE)
}
require("e1071")

sapply(loan_dataset[, 5:12],  kurtosis, type = 2)
#skeweness
sapply(loan_dataset[, 5:12],  skewness, type = 2)

#Measure relationship
#covariance
loan_dataset_cov <- cov(loan_dataset[, 5:12])
View(loan_dataset_cov)

#correlation 
loan_dataset_cor <- cor(loan_dataset[, 5:12])
View(loan_dataset_cor)

#Measure of distribution
#anova 
loan_dataset_one_way_anova <- aov(loan_term ~ loan_amount, data = loan_dataset)
summary(loan_dataset_one_way_anova)

#visulizations 
#loan term frequency
loan_dataset_loan_term <- as.numeric(unlist(loan_dataset[, 7]))
hist(loan_dataset_loan_term, main = names(loan_dataset)[7])

boxplot(loan_dataset[, 7], main = names(loan_dataset)[7])
boxplot(loan_dataset[, 8], main = names(loan_dataset)[8])
boxplot(loan_dataset[, 9], main = names(loan_dataset)[9])
boxplot(loan_dataset[, 10], main = names(loan_dataset)[10])

par(mfrow = c(1, 2))
for (i in 1:2) {
  boxplot(loan_dataset[, i], main = names(loan_dataset)[i])
}
#loan final status 
barplot(table(loan_dataset[, 13]), main = names(loan_dataset)[13])

barplot(table(loan_dataset[, 3]), main = names(loan_dataset)[3])

#missingness
if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE)
}
require("Amelia")

missmap(loan_dataset, col = c("black", "lightgreen"), legend = TRUE)

if (!is.element("corrplot", installed.packages()[, 1])) {
  install.packages("corrplot", dependencies = TRUE)
}
require("corrplot")

corrplot(cor(loan_dataset[, 5:12]), method = "circle")

if (!is.element("ggcorrplot", installed.packages()[, 1])) {
  install.packages("ggcorrplot", dependencies = TRUE)
}
require("ggcorrplot")

ggcorrplot(cor(loan_dataset[, 5:12]))

#multivariate visulaization
if (!is.element("caret", installed.packages()[, 1])) {
  install.packages("caret", dependencies = TRUE)
}
require("caret")

featurePlot(x = loan_dataset[, 1:4], y = loan_dataset[, 12], plot = "box")

######################################################################################

## MILESTONE 2##
#confirmimg any missing data 
.libPaths()
lapply(.libPaths(), list.files)

if (!is.element("languageserver", installed.packages()[, 1])) {
  install.packages("languageserver", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("languageserver")



if (!is.element("NHANES", installed.packages()[, 1])) {
  install.packages("NHANES", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("NHANES")

## dplyr ----
if (!is.element("dplyr", installed.packages()[, 1])) {
  install.packages("dplyr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("dplyr")

if (!is.element("naniar", installed.packages()[, 1])) {
  install.packages("naniar", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("naniar")

#create subset variable of the datset
loan_dataset <- loan_dataset %>%
  select(loan_id, education, loan_amount, loan_term, self_employed, income_annum, cibil_score,
         no_of_dependents, residential_assets_value, commercial_assets_value, luxury_assets_value, bank_asset_value, loan_status)

#select random obsservation
rand_ind <- sample(seq_len(nrow(loan_dataset)), 4269)
loan_dataset <- loan_dataset[rand_ind, ]

#check if there is missing data 
any_na(loan_dataset)

#no missing data 

#Data transformation
if (require("mlbench")) {
  require("mlbench")
} else {
  install.packages("mlbench", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## readr ----
if (require("readr")) {
  require("readr")
} else {
  install.packages("readr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## e1071 ----
if (require("e1071")) {
  require("e1071")
} else {
  install.packages("e1071", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## factoextra ----
if (require("factoextra")) {
  require("factoextra")
} else {
  install.packages("factoextra", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## FactoMineR ----
if (require("FactoMineR")) {
  require("FactoMineR")
} else {
  install.packages("FactoMineR", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

#scale basic data transform 
#before transform 
if (!is.element("caret", installed.packages()[, 1])) {
  install.packages("caret", dependencies = TRUE)
}
require("caret")

summary(loan_dataset)

loan_dataset_loan_status <- as.numeric(unlist(loan_dataset[, 4]))
hist(loan_dataset_loan_status, main = names(loan_dataset)[4])

model_of_the_transform <- preProcess(loan_dataset, method = c("scale"))
print(model_of_the_transform)
loan_dataset_scale_transform <- predict(model_of_the_transform, loan_dataset)

#after transformation
summary(loan_dataset_scale_transform)
loan_dataset_loan_status <- as.numeric(unlist(loan_dataset_scale_transform[, 4]))
hist(loan_dataset_loan_status, main = names(loan_dataset_scale_transform)[4])

######################################################################################
## MILESTONE 3 ##
#evaluation metrics 
#install packages 
if (require("pROC")) {
  require("pROC")
} else {
  install.packages("pROC", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## dplyr ----
if (require("dplyr")) {
  require("dplyr")
} else {
  install.packages("dplyr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

loan_dataset_freq <- loan_dataset$loan_status
cbind(frequency =
        table(loan_dataset_freq),
      percentage = prop.table(table(loan_dataset_freq)) * 100)

#split the dataset
train_index <- createDataPartition(loan_dataset$loan_status,
                                   p = 0.75,
                                   list = FALSE)
loan_dataset_train <- loan_dataset[train_index, ]
loan_dataset_test <- loan_dataset[-train_index, ]

#train the model
train_control <- trainControl(method = "cv", number = 13)

set.seed(7)
loan_dataset_model_glm <-
  train(loan_status ~ ., data = loan_dataset_train, method = "glm",
        metric = "Accuracy", trControl = train_control)
#model performance 
print(loan_dataset_model_glm)



#model training for classification problem 
#Decision tree for a classification problem with caret ----
train_index <- createDataPartition(loan_dataset$loan_status,
                                   p = 0.7,
                                   list = FALSE)
loan_dataset_train <- loan_dataset[train_index, ]
loan_dataset_test <- loan_dataset[-train_index, ]


#### Train the model ----
set.seed(7)
# 5-fold cross validation resampling method
train_control <- trainControl(method = "cv", number = 13)
loan_dataset_caret_model_rpart <- train(loan_status ~ ., data = loan_dataset,
                                    method = "rpart", metric = "Accuracy",
                                    trControl = train_control)


print(loan_dataset_caret_model_rpart)
#predict
predictions <- predict(loan_dataset_caret_model_rpart,
                       loan_dataset_test[, 1:13],
                       type = "raw")

#model performance 
table(predictions, loan_dataset_test$loan_status)




#model performanace comparison
train_control <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
#LDA
set.seed(7)
loan_dataset_model_lda <- train(loan_status ~ ., data = loan_dataset,
                            method = "lda", trControl = train_control)

#CART

set.seed(7)
loan_dataset_model_cart <- train(loan_status ~ ., data = loan_dataset,
                             method = "rpart", trControl = train_control)


#KNN

set.seed(7)
loan_dataset_model_knn <- train(loan_status ~ ., data = loan_dataset,
                            method = "knn", trControl = train_control)

#call resamples functions 

results <- resamples(list(LDA = loan_dataset_model_lda, CART = loan_dataset_model_cart,
                          KNN = loan_dataset_model_knn))
                         

#results of the resample functions 
summary(results)

#box plot of the results
scales <- list(x = list(relation = "free"), y = list(relation = "free"))
bwplot(results, scales = scales)

#####################################################################################
## MILESTONE 4 ##
#Ensemble  methods 
#install packages 
## mlbench ----
if (require("mlbench")) {
  require("mlbench")
} else {
  install.packages("mlbench", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## caret ----
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## caretEnsemble ----
if (require("caretEnsemble")) {
  require("caretEnsemble")
} else {
  install.packages("caretEnsemble", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## C50 ----
if (require("C50")) {
  require("C50")
} else {
  install.packages("C50", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## adabag ----
if (require("adabag")) {
  require("adabag")
} else {
  install.packages("adabag", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

#Bagging 
train_control <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
seed <- 7
metric <- "Accuracy"

#bagged cart 
set.seed(seed)
loan_dataset_model_bagged_cart <- train(loan_status ~ ., data = loan_dataset, method = "treebag",
                               metric = metric,
                               trControl = train_control)


#random forest
set.seed(seed)
loan_dataset_model_rf <- train(loan_status ~ ., data = loan_dataset, method = "rf",
                      metric = metric, trControl = train_control)


# Summarize results
bagging_results <-
  resamples(list("Bagged Decision Tree" = loan_dataset_model_bagged_cart,
                 "Random Forest" = loan_dataset_model_rf))

summary(bagging_results)


#plot of the results
dotplot(bagging_results)

######################################################################################
## MILESTOEN 5##

#load the dataset
library(readr)
loan_dataset <- read_csv("Data/loan_dataset.csv")
View(loan_dataset)

#save the model
.libPaths()
lapply(.libPaths(), list.files)

if (require("languageserver")) {
  require("languageserver")
} else {
  install.packages("languageserver", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## caret ----
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## mlbench ----
if (require("mlbench")) {
  require("mlbench")
} else {
  install.packages("mlbench", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## plumber ----
if (require("plumber")) {
  require("plumber")
} else {
  install.packages("plumber", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

set.seed(9)
train_index <- createDataPartition(loan_dataset$loan_status,
                                   p = 0.80, list = FALSE)
loan_dataset_training <- loan_dataset[train_index, ]
loan_dataset_testing <- loan_dataset[-train_index, ]

set.seed(9)
train_control <- trainControl(method = "cv", number = 10)
loan_dataset_model_lda <- train(loan_status ~ ., data = loan_dataset,
                                method = "lda", metric = "Accuracy",
                                trControl = train_control)
#summary
print(loan_dataset_model_lda)

#details of the model
print(loan_dataset_model_lda$finalModel)

#test model
set.seed(9)
predictions <- predict(loan_dataset_model_lda, newdata = loan_dataset_testing)

#save and load model

saveRDS(loan_dataset_model_lda, "./models/saved_loan_dataset_model_lda.rds")
# The saved model can then be loaded later as follows:
loaded_loan_dataset_model_lda <- readRDS("./models/saved_loan_dataset_model_lda.rds")
print(loaded_loan_dataset_model_lda)

predictions_with_loaded_model <-
  predict(loaded_loan_dataset_model_lda, newdata = loan_dataset_testing)

#craete funcion in R
name_of_function <- function(arg) {
  
}

#make prediction using saved model
to_be_predicted <-
  data.frame(loan_id = 1, no_of_dependents = 2, education = "Graduate", self_employed = "No" ,
             income_annum = 9600000, loan_amount = 29900000, loan_term = 12, cibil_score = 778,
             residential_assets_value = 2400000, commercial_assets_value =17600000, luxury_assets_value = 22700000, bank_asset_value = 8000000)



# make predictions
predict(loaded_loan_dataset_model_lda, newdata = to_be_predicted)

#Make predictions using the model through a function ----

predict_loan_status <-
  function(arg_loan_id, arg_no_of_dependents, arg_education, arg_self_employed, arg_income_annum,
           arg_loan_amount, arg_loan_term, arg_cibil_score,arg_residential_assets_value,arg_commercial_assets_value,arg_luxury_assets_value,arg_bank_asset_value) {
    # Create a data frame using the arguments
    to_be_predicted <-
      data.frame(loan_id = arg_loan_id, no_of_dependents = arg_no_of_dependents,
                 education = arg_education, self_employed = arg_self_employed,
                 income_annum = arg_income_annum, loan_amount = arg_loan_amount,
                 loan_term = arg_loan_term, cibil_score = arg_cibil_score , residential_assets_value = arg_residential_assets_value, commercial_assets_value = arg_commercial_assets_value, luxury_assets_value = arg_luxury_assets_value ,
                 bank_asset_value= arg_bank_asset_value)
    
    # Make a prediction based on the data frame
    predict(loaded_loan_dataset_model_lda, to_be_predicted)
  }  
predict_loan_status(1, 2, 'Graduate', 'No', 25489000, 345890, 12, 124, 685578, 4500000,9875000,3400000)

predict_loan_status(2, 3, 'Not Graduate', 'Yes', 2548900, 345900, 14, 124, 685878, 4657900,678000654,4590000)



