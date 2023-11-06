#Lab 1: Loading dataset
library(readr)
Loan_Data <- read_csv("Data/Loan_Data.csv")
View(Loan_Data)

################################################################################################

# Lab 2: Exploratory Data Analysis ----
if (!is.element("renv", installed.packages()[, 1])) {
  install.packages("renv", dependencies = TRUE)
}
require("renv")

renv::init()
renv::restore()

if (!is.element("languageserver", installed.packages()[, 1])) {
  install.packages("languageserver", dependencies = TRUE)
}
require("languageserver")

if (!is.element("readr", installed.packages()[, 1])) {
  install.packages("readr", dependencies = TRUE)
}
require("readr")

if (!is.element("mlbench", installed.packages()[, 1])) {
  install.packages("mlbench", dependencies = TRUE)
}
require("mlbench")
data("Loan_Data")
dim(Loan_Data)
sapply(Loan_Data, class)

## Measures of Frequency ----
Loan_Data_Dependents_freq <- Loan_Data$Dependents
cbind(frequency = table(Loan_Data_Dependents_freq),
      percentage = prop.table(table(Loan_Data_Dependents_freq)) * 100)

## Measures of Central Tendency ----
Loan_Data_Amount_mode <- names(table(Loan_Data$Amount))[
  which(table(Loan_Data$Amount) == max(table(Loan_Data$Amount)))
]
print(Loan_Data_Amount_mode)

## Measures of Distribution/Dispersion/Spread/Scatter/Variability ----
summary(Loan_Data)

## Measure the standard deviation 
sapply(Loan_Data[, -7], sd)
sapply(Loan_Data[, c(1, 2, 3, 5, 6, 7)], sd)

sapply(Loan_Data[, 4], sd)

#Measure the variance
sapply(Loan_Data[, -7], var)

#Measure the kurtosis
if (!is.element("e1071", installed.packages()[, 1])) {
  install.packages("e1071", dependencies = TRUE)
}
require("e1071")

sapply(Loan_Data[, -7],  kurtosis, type = 2)

# Measure the skewness
sapply(Loan_Data[, -7],  skewness, type = 2)

#Measure the covariance
Loan_Data_cov <- cov(Loan_Data[, 7])
View(Loan_Data_cov)


#correlation
Loan_Data_cor <- cor(Loan_Data[, 7])
View(Loan_Data_cor)

#anova
Loan_Data_one_way_anova <- aov(Amount ~ Income, data = Loan_Data)
summary(Loan_Data_one_way_anova)

#Visualizations: Histogram
Loan_Data_History <- as.numeric(unlist(Loan_Data[, 7]))
hist(Loan_Data_History, main = names(Loan_Data)[7])
#barplot
barplot(table(Loan_Data[, 4]), main = names(Loan_Data)[4])
#boxplot
Loan_Data_Income <- as.numeric(unlist(Loan_Data[, 7]))
boxplot(Loan_Data_Income, main = names(Loan_Data)[7])
#Missing Data

if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE)
}
require("Amelia")

missmap(Loan_Data, col = c("Pink", "black"), legend = TRUE)
#correlation plot
if (!is.element("corrplot", installed.packages()[, 1])) {
  install.packages("corrplot", dependencies = TRUE)
}
require("corrplot")
if (!is.element("ggcorrplot", installed.packages()[, 1])) {
  install.packages("ggcorrplot", dependencies = TRUE)
}
require("ggcorrplot")

ggcorrplot(cor(Loan_Data[, 7]))
#scatter plot
if (!is.element("ggcorrplot", installed.packages()[, 1])) {
  install.packages("ggcorrplot", dependencies = TRUE)
}
require("ggcorrplot")

ggplot(Loan_Data,
       aes(x = Employed, y = Income, shape = Employed, color = Income2)) +
  geom_point() +
  geom_smooth(method = lm)

#Create Multivariate Box and Whisker Plots by Class ----
if (!is.element("caret", installed.packages()[, 1])) {
  install.packages("caret", dependencies = TRUE)
}
require("caret")

featurePlot(x = Loan_Data[, 1:7], y = Loan_Data[, 4], plot = "box")
renv::snapshot()

##############
## Lab 2.b.: Exploratory Data Analysis for Qualitative Data ----
.libPaths()
lapply(.libPaths(), list.files)
if (!is.element("dplyr", installed.packages()[, 1])) {
  install.packages("dplyr", dependencies = TRUE)
}
require("dplyr")


if (!is.element("ggplot2", installed.packages()[, 1])) {
  install.packages("ggplot2", dependencies = TRUE)
}
require("ggplot2")

if (!is.element("ggrepel", installed.packages()[, 1])) {
  install.packages("ggrepel", dependencies = TRUE)
}
require("ggrepel")


if (!is.element("ggraph", installed.packages()[, 1])) {
  install.packages("ggraph", dependencies = TRUE)
}
require("ggraph")


if (!is.element("tidytext", installed.packages()[, 1])) {
  install.packages("tidytext", dependencies = TRUE)
}
require("tidytext")


if (!is.element("tidyr", installed.packages()[, 1])) {
  install.packages("tidyr", dependencies = TRUE)
}
require("tidyr")


if (!is.element("widyr", installed.packages()[, 1])) {
  install.packages("widyr", dependencies = TRUE)
}
require("widyr")


if (!is.element("gridExtra", installed.packages()[, 1])) {
  install.packages("gridExtra", dependencies = TRUE)
}
require("gridExtra")


if (!is.element("knitr", installed.packages()[, 1])) {
  install.packages("knitr", dependencies = TRUE)
}
require("knitr")


if (!is.element("kableExtra", installed.packages()[, 1])) {
  install.packages("kableExtra", dependencies = TRUE)
}
require("kableExtra")

if (!is.element("formattable", installed.packages()[, 1])) {
  install.packages("formattable", dependencies = TRUE)
}
require("formattable")

if (!is.element("circlize", installed.packages()[, 1])) {
  install.packages("circlize", dependencies = TRUE)
}
require("circlize")

if (!is.element("memery", installed.packages()[, 1])) {
  install.packages("memery", dependencies = TRUE)
}
require("memery")


if (!is.element("magick", installed.packages()[, 1])) {
  install.packages("magick", dependencies = TRUE)
}
require("magick")


if (!is.element("yarrr", installed.packages()[, 1])) {
  install.packages("yarrr", dependencies = TRUE)
}
require("yarrr")


if (!is.element("radarchart", installed.packages()[, 1])) {
  install.packages("radarchart", dependencies = TRUE)
}
require("radarchart")


if (!is.element("igraph", installed.packages()[, 1])) {
  install.packages("igraph", dependencies = TRUE)
}
require("igraph")


if (!is.element("wordcloud2", installed.packages()[, 1])) {
  install.packages("wordcloud2", dependencies = TRUE)
}
require("wordcloud2")

## readr - Load datasets from CSV files ----
if (!is.element("readr", installed.packages()[, 1])) {
  install.packages("readr", dependencies = TRUE, repos="https://cloud.r-project.org")
}
require("readr")

# Customize the Visualizations, Tables, and Colour Scheme ----
blue_grey_colours_4 <- c("#27408E", "#536CB5",
                         "#B9BCC2", "#888A8E")

blue_grey_theme <- function() {
  theme(
    axis.ticks = element_line(
      linewidth = 1, linetype = "dashed",
      lineend = NULL, color = "#dfdede",
      arrow = NULL, inherit.blank = FALSE),
    axis.text = element_text(
      face = "bold", color = "#3f3f41",
      size = 12, hjust = 0.5),
    axis.title = element_text(face = "bold", color = "#3f3f41",
                              size = 14, hjust = 0.5),
    plot.title = element_text(face = "bold", color = "#3f3f41",
                              size = 16, hjust = 0.5),
    panel.grid = element_line(
      linewidth = 0.1, linetype = "dashed",
      lineend = NULL, color = "#dfdede",
      arrow = NULL, inherit.blank = FALSE),
    panel.background = element_rect(fill = "#f3eeee"),
    legend.title = element_text(face = "plain", color = "#3f3f41",
                                size = 12, hjust = 0),
    legend.position = "right"
  )
}

kable_theme <- function(dat, caption) {
  kable(dat, "html", escape = FALSE, caption = caption) %>%
    kable_styling(bootstrap_options = c("striped", "condensed", "bordered"),
                  full_width = FALSE)
}

# Dimensions
dim(Loan_Data)

# Data Types
sapply(Loan_Data, class)
glimpse(Loan_Data)

# Summary of each variable
summary(Loan_Data)


#Contractions:  Evaluation likes and wishes
#remove special characters
#Lemmatization
#Tokenization

#stop word removal
View(stop_words)
#######################
# Lab 2.c.: Sentiment Analysis (Lexicon-Based) ----
############################################################################################

# Lab 4: Data Transformation ----
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

## ggplot2 ----
# We require the "ggplot2" package to create more appealing visualizations
if (!is.element("ggplot2", installed.packages()[, 1])) {
  install.packages("ggplot2", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("ggplot2")

## MICE ----
# We use the MICE package to perform data imputation
if (!is.element("mice", installed.packages()[, 1])) {
  install.packages("mice", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("mice")

## Amelia ----
if (!is.element("Amelia", installed.packages()[, 1])) {
  install.packages("Amelia", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
require("Amelia")
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
#confirmation of missing data
any_na(Loan_Data)

# How many?
n_miss(Loan_Data)

# What is the percentage of missing data in the entire dataset?
prop_miss(Loan_Data)

# How many missing values does each variable have?
Loan_Data %>% is.na() %>% colSums()

# What is the number and percentage of missing values grouped by
# each variable?
miss_var_summary(Loan_Data)

# What is the number and percentage of missing values grouped by
# each observation?
miss_case_summary(Loan_Data)

# Which variables contain the most missing values?
gg_miss_var(Loan_Data)

# Where are missing values located (the shaded regions in the plot)?
vis_miss(Loan_Data) + theme(axis.text.x = element_text(angle = 80))

# Which combinations of variables are missing together?
gg_miss_upset(Loan_Data)

#scale data transform
summary(Loan_Data)

Loan_Data_Amount <- as.numeric(unlist(Loan_Data[, 7]))
hist(Loan_Data_Amount, main = names(Loan_Data)[7])

model_of_the_transform <- preProcess(Loan_Data, method = c("scale"))
print(model_of_the_transform)
Loan_Data_scale_transform <- predict(model_of_the_transform, Loan_Data)
#after

summary(Loan_Data_scale_transform)
Loan_Data_Amount <- as.numeric(unlist(Loan_Data_scale_transform[, 7]))
hist(Loan_Data_Amount, main = names(Loan_Data_scale_transform)[7])

# Center Data Transform ----
summary(Loan_Data)
model_of_the_transform <- preProcess(Loan_Data, method = c("center"))
print(model_of_the_transform)
Loan_Data_center_transform <- predict(model_of_the_transform, Loan_Data)
summary(Loan_Data_center_transform)

# Standardize Data Transform ----
summary(Loan_Data)
sapply(Loan_Data[, 7], sd)
model_of_the_transform <- preProcess(Loan_Data,
                                     method = c("scale", "center"))
print(model_of_the_transform)
Loan_Data_standardize_transform <- predict(model_of_the_transform, Loan_Data)

summary(Loan_Data_standardize_transform)
sapply(Loan_Data_standardize_transform[, 7], sd)

# Normalize Data Transform ----
summary(Loan_Data)
model_of_the_transform <- preProcess(Loan_Data, method = c("range"))
print(model_of_the_transform)
Loan_Data_normalize_transform <- predict(model_of_the_transform, Loan_Data)
summary(Loan_Data_normalize_transform)

# Box-Cox Power Transform ----
summary(Loan_Data_standardize_transform)
# Calculate the skewness before the Box-Cox transform
sapply(Loan_Data_standardize_transform[, 7],  skewness, type = 2)
sapply(Loan_Data_standardize_transform[, 7], sd)

model_of_the_transform <- preProcess(Loan_Data_standardize_transform,
                                     method = c("BoxCox"))
print(model_of_the_transform)
Loan_Data_box_cox_transform <- predict(model_of_the_transform,
                                       Loan_Data_standardize_transform)

# AFTER
summary(Loan_Data_box_cox_transform)

sapply(Loan_Data_box_cox_transform[, 7],  skewness, type = 2)
sapply(Loan_Data_box_cox_transform[, 7], sd)
# Calculate the skewness after the Box-Cox transform
sapply(Loan_Data_box_cox_transform[, 7],  skewness, type = 2)
sapply(Loan_Data_box_cox_transform[, 7], sd)

# Yeo-Johnson Power Transform ----
# BEFORE
summary(Loan_Data_standardize_transform)

# Calculate the skewness before the Yeo-Johnson transform
sapply(Loan_Data_standardize_transform[, 7],  skewness, type = 2)
sapply(Loan_Data_standardize_transform[, 7], sd)

model_of_the_transform <- preProcess(Loan_Data_standardize_transform,
                                     method = c("YeoJohnson"))
print(model_of_the_transform)
Loan_Data_yeo_johnson_transform <- predict(model_of_the_transform, 
                                          Loan_Data_standardize_transform)

# AFTER
summary(Loan_Data_yeo_johnson_transform)

# Calculate the skewness after the Yeo-Johnson transform
sapply(Loan_Data_yeo_johnson_transform[, 7],  skewness, type = 2)
sapply(Loan_Data_yeo_johnson_transform[, 7], sd)

# Principal Component Analysis (PCA) Linear Algebra Transform ----
summary(Loan_Data)

model_of_the_transform <- preProcess(Loan_Data,
                                     method = c("scale", "center", "pca"))
print(model_of_the_transform)
Loan_Data_pca_dr <- predict(model_of_the_transform, Loan_Data)

summary(Loan_Data_pca_dr)
dim(Loan_Data_pca_dr)

#ICA Linear Algebra Transform for Dimensionality Reduction ----

if (!is.element("fastICA", installed.packages()[, 1])) {
  install.packages("fastICA", dependencies = TRUE)
}
require("fastICA")

summary(Loan_Data)
model_of_the_transform <- preProcess(Loan_Data,
                                     method = c("scale", "center", "ica"),
                                     n.comp = 3)
print(model_of_the_transform)
Loan_Data_ica_dr <- predict(model_of_the_transform, Loan_Data)

summary(Loan_Data_ica_dr)
##########################################################################################

# Lab 5: Resampling Methods ----
if (require("klaR")) {
  require("klaR")
} else {
  install.packages("klaR", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

if (require("LiblineaR")) {
  require("LiblineaR")
} else {
  install.packages("LiblineaR", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## naivebayes ----
if (require("naivebayes")) {
  require("naivebayes")
} else {
  install.packages("naivebayes", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

str(Loan_Data)
## 1. Split the dataset ====
train_index <- createDataPartition(Loan_Data$Dependents,
                                   p = 0.75,
                                   list = FALSE)
Loan_Data_train <- Loan_Data[train_index, ]
Loan_Data_test <- Loan_Data[-train_index, ]

#bootstraping

