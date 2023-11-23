Business Intelligence Project
================
<Ayan Ahmed>
\<17th November\>

- [Student Details](#student-details)

# Student Details

|                       |              |
|-----------------------|--------------|
| **Student ID Number** | 127039 …     |
| **Student Name**      | Ayan Ahmed … |
| **BBIT 4.2 Group**    | .C..         |

\#load the dataset

``` r
library(readr)
loan_dataset <- read_csv("Data/loan_dataset.csv")
```

    ## Rows: 4269 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (3): education, self_employed, loan_status
    ## dbl (10): loan_id, no_of_dependents, income_annum, loan_amount, loan_term, c...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
View(loan_dataset)
```

\#install packages

``` r
.libPaths()
```

    ## [1] "C:/Users/ayern/AppData/Local/R/win-library/4.3"
    ## [2] "C:/Program Files/R/R-4.3.1/library"

``` r
lapply(.libPaths(), list.files)
```

    ## [[1]]
    ##   [1] "abind"           "adabag"          "ade4"            "Amelia"         
    ##   [5] "arules"          "arulesViz"       "askpass"         "backports"      
    ##   [9] "base64enc"       "BayesFactor"     "BiocManager"     "bit"            
    ##  [13] "bit64"           "blob"            "brew"            "brio"           
    ##  [17] "broom"           "bslib"           "C50"             "ca"             
    ##  [21] "cachem"          "Cairo"           "callr"           "car"            
    ##  [25] "carData"         "caret"           "caretEnsemble"   "cellranger"     
    ##  [29] "circlize"        "classInt"        "cli"             "clipr"          
    ##  [33] "clock"           "coda"            "collections"     "colorspace"     
    ##  [37] "colourpicker"    "combinat"        "commonmark"      "conflicted"     
    ##  [41] "ConsRank"        "contfrac"        "corrplot"        "covr"           
    ##  [45] "cowplot"         "cpp11"           "crayon"          "credentials"    
    ##  [49] "crosstalk"       "Cubist"          "curl"            "cyclocomp"      
    ##  [53] "data.table"      "DBI"             "dbplyr"          "dendextend"     
    ##  [57] "desc"            "deSolve"         "devtools"        "diagram"        
    ##  [61] "diffobj"         "digest"          "doParallel"      "downlit"        
    ##  [65] "dplyr"           "DT"              "dtplyr"          "e1071"          
    ##  [69] "ellipse"         "ellipsis"        "elliptic"        "emmeans"        
    ##  [73] "estimability"    "evaluate"        "factoextra"      "FactoMineR"     
    ##  [77] "fansi"           "farver"          "fastICA"         "fastmap"        
    ##  [81] "flashClust"      "fontawesome"     "forcats"         "foreach"        
    ##  [85] "formattable"     "Formula"         "fs"              "future"         
    ##  [89] "future.apply"    "gargle"          "gbm"             "gclus"          
    ##  [93] "generics"        "gert"            "ggcorrplot"      "ggforce"        
    ##  [97] "ggplot2"         "ggpubr"          "ggraph"          "ggrepel"        
    ## [101] "ggsci"           "ggsignif"        "gh"              "gitcreds"       
    ## [105] "glmnet"          "GlobalOptions"   "globals"         "glue"           
    ## [109] "googledrive"     "googlesheets4"   "gower"           "graphlayouts"   
    ## [113] "gridExtra"       "gtable"          "gtools"          "hardhat"        
    ## [117] "haven"           "here"            "highr"           "hms"            
    ## [121] "htmltools"       "htmlwidgets"     "httpuv"          "httr"           
    ## [125] "httr2"           "hypergeo"        "ids"             "igraph"         
    ## [129] "ini"             "inum"            "ipred"           "isoband"        
    ## [133] "iterators"       "janeaustenr"     "jomo"            "jpeg"           
    ## [137] "jquerylib"       "jsonlite"        "kableExtra"      "kernlab"        
    ## [141] "klaR"            "knitr"           "labeling"        "labelled"       
    ## [145] "languageserver"  "later"           "lava"            "lazyeval"       
    ## [149] "leaps"           "libcoin"         "LiblineaR"       "lifecycle"      
    ## [153] "lintr"           "listenv"         "lme4"            "lmtest"         
    ## [157] "lubridate"       "magick"          "magrittr"        "markdown"       
    ## [161] "Matrix"          "MatrixModels"    "mclust"          "memery"         
    ## [165] "memoise"         "mice"            "mime"            "miniUI"         
    ## [169] "minqa"           "mitml"           "mlbench"         "ModelMetrics"   
    ## [173] "modelr"          "multcompView"    "munsell"         "mvtnorm"        
    ## [177] "naivebayes"      "naniar"          "NHANES"          "nloptr"         
    ## [181] "norm"            "numDeriv"        "openssl"         "ordinal"        
    ## [185] "packrat"         "pak"             "pan"             "parallelly"     
    ## [189] "partykit"        "pbapply"         "pbkrtest"        "permute"        
    ## [193] "pillar"          "pixmap"          "pkgbuild"        "pkgconfig"      
    ## [197] "pkgdown"         "pkgload"         "plotly"          "plumber"        
    ## [201] "plyr"            "png"             "polyclip"        "polynom"        
    ## [205] "praise"          "prettyunits"     "pROC"            "processx"       
    ## [209] "prodlim"         "profvis"         "progress"        "progressr"      
    ## [213] "promises"        "proxy"           "ps"              "purrr"          
    ## [217] "qap"             "quantreg"        "questionr"       "R.cache"        
    ## [221] "R.methodsS3"     "R.oo"            "R.utils"         "R6"             
    ## [225] "radarchart"      "ragg"            "randomForest"    "rappdirs"       
    ## [229] "rcmdcheck"       "RColorBrewer"    "Rcpp"            "RcppArmadillo"  
    ## [233] "RcppEigen"       "RcppTOML"        "readr"           "readxl"         
    ## [237] "recipes"         "registry"        "rematch"         "rematch2"       
    ## [241] "remotes"         "renv"            "reprex"          "reshape2"       
    ## [245] "reticulate"      "rex"             "rgl"             "rlang"          
    ## [249] "rlist"           "rmarkdown"       "roxygen2"        "rprojroot"      
    ## [253] "RRF"             "rstatix"         "rstudioapi"      "rversions"      
    ## [257] "rvest"           "sass"            "scales"          "scatterplot3d"  
    ## [261] "selectr"         "seriation"       "sessioninfo"     "shape"          
    ## [265] "shiny"           "shinyBS"         "shinycssloaders" "shinyjs"        
    ## [269] "showtext"        "showtextdb"      "SnowballC"       "sodium"         
    ## [273] "sourcetools"     "sp"              "SparseM"         "SQUAREM"        
    ## [277] "stringi"         "stringr"         "styler"          "svglite"        
    ## [281] "swagger"         "sys"             "sysfonts"        "systemfonts"    
    ## [285] "testthat"        "textdata"        "textshaping"     "tibble"         
    ## [289] "tidygraph"       "tidyr"           "tidyselect"      "tidytext"       
    ## [293] "tidyverse"       "timechange"      "timeDate"        "tinytex"        
    ## [297] "tokenizers"      "TSP"             "tweenr"          "tzdb"           
    ## [301] "ucminf"          "UpSetR"          "urlchecker"      "usethis"        
    ## [305] "utf8"            "uuid"            "vcd"             "vctrs"          
    ## [309] "vegan"           "viridis"         "viridisLite"     "visdat"         
    ## [313] "visNetwork"      "vroom"           "waldo"           "webfakes"       
    ## [317] "webshot"         "webutils"        "whisker"         "widyr"          
    ## [321] "withr"           "wordcloud2"      "xfun"            "XML"            
    ## [325] "xml2"            "xmlparsedata"    "xopen"           "xtable"         
    ## [329] "yaml"            "yarrr"           "zip"             "zoo"            
    ## 
    ## [[2]]
    ##  [1] "base"         "boot"         "class"        "cluster"      "codetools"   
    ##  [6] "compiler"     "datasets"     "foreign"      "graphics"     "grDevices"   
    ## [11] "grid"         "KernSmooth"   "lattice"      "MASS"         "Matrix"      
    ## [16] "methods"      "mgcv"         "nlme"         "nnet"         "parallel"    
    ## [21] "rpart"        "spatial"      "splines"      "stats"        "stats4"      
    ## [26] "survival"     "tcltk"        "tools"        "translations" "utils"

``` r
if (require("languageserver")) {
  require("languageserver")
} else {
  install.packages("languageserver", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: languageserver

``` r
## caret ----
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: caret

    ## Loading required package: ggplot2

    ## Loading required package: lattice

``` r
## mlbench ----
if (require("mlbench")) {
  require("mlbench")
} else {
  install.packages("mlbench", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: mlbench

``` r
## plumber ----
if (require("plumber")) {
  require("plumber")
} else {
  install.packages("plumber", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: plumber

\#split the model

``` r
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
```

\#summary of the data

``` r
print(loan_dataset_model_lda)
```

    ## Linear Discriminant Analysis 
    ## 
    ## 4269 samples
    ##   12 predictor
    ##    2 classes: 'Approved', 'Rejected' 
    ## 
    ## No pre-processing
    ## Resampling: Cross-Validated (10 fold) 
    ## Summary of sample sizes: 3841, 3842, 3841, 3842, 3843, 3842, ... 
    ## Resampling results:
    ## 
    ##   Accuracy   Kappa    
    ##   0.9238742  0.8405131

\#details of the model

``` r
print(loan_dataset_model_lda$finalModel)
```

    ## Call:
    ## lda(x, grouping = y)
    ## 
    ## Prior probabilities of groups:
    ##  Approved  Rejected 
    ## 0.6221598 0.3778402 
    ## 
    ## Group means:
    ##           loan_id no_of_dependents educationNot Graduate self_employedYes
    ## Approved 2151.984         2.474774             0.4958584        0.5037651
    ## Rejected 2107.033         2.538128             0.5009299        0.5034098
    ##          income_annum loan_amount loan_term cibil_score
    ## Approved      5025904    15247252  10.39759    703.4620
    ## Rejected      5113825    14946063  11.72846    429.4681
    ##          residential_assets_value commercial_assets_value luxury_assets_value
    ## Approved                  7399812                 5001355            15016604
    ## Rejected                  7592498                 4926720            15306944
    ##          bank_asset_value
    ## Approved          4959526
    ## Rejected          5004960
    ## 
    ## Coefficients of linear discriminants:
    ##                                    LD1
    ## loan_id                  -1.193403e-05
    ## no_of_dependents          1.312921e-02
    ## educationNot Graduate     3.133061e-02
    ## self_employedYes         -2.080410e-02
    ## income_annum              1.626627e-07
    ## loan_amount              -4.306179e-08
    ## loan_term                 4.278381e-02
    ## cibil_score              -9.176662e-03
    ## residential_assets_value  6.548441e-10
    ## commercial_assets_value  -5.055733e-09
    ## luxury_assets_value      -7.724493e-09
    ## bank_asset_value         -9.539870e-09

\#test model

``` r
set.seed(9)
predictions <- predict(loan_dataset_model_lda, newdata = loan_dataset_testing)
```

\#save and load model

``` r
saveRDS(loan_dataset_model_lda, "./models/saved_loan_dataset_model_lda.rds")
# The saved model can then be loaded later as follows:
loaded_loan_dataset_model_lda <- readRDS("./models/saved_loan_dataset_model_lda.rds")
print(loaded_loan_dataset_model_lda)
```

    ## Linear Discriminant Analysis 
    ## 
    ## 4269 samples
    ##   12 predictor
    ##    2 classes: 'Approved', 'Rejected' 
    ## 
    ## No pre-processing
    ## Resampling: Cross-Validated (10 fold) 
    ## Summary of sample sizes: 3841, 3842, 3841, 3842, 3843, 3842, ... 
    ## Resampling results:
    ## 
    ##   Accuracy   Kappa    
    ##   0.9238742  0.8405131

``` r
predictions_with_loaded_model <-
  predict(loaded_loan_dataset_model_lda, newdata = loan_dataset_testing)
```

\#create function in R

``` r
name_of_function <- function(arg) {
  
}
```

\#make predictions using the following variables

``` r
to_be_predicted <-
  data.frame(loan_id = 1, no_of_dependents = 2, education = "Graduate", self_employed = "No" ,
             income_annum = 9600000, loan_amount = 29900000, loan_term = 12, cibil_score = 778,
             residential_assets_value = 2400000, commercial_assets_value =17600000, luxury_assets_value = 22700000, bank_asset_value = 8000000)
```

\#make prediction

``` r
predict(loaded_loan_dataset_model_lda, newdata = to_be_predicted)
```

    ## [1] Approved
    ## Levels: Approved Rejected

\#make prediction using fubction

``` r
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
```

\#exmaple of predictions

``` r
predict_loan_status(1, 2, 'Graduate', 'No', 25489000, 345890, 12, 124, 685578, 4500000,9875000,3400000)
```

    ## [1] Rejected
    ## Levels: Approved Rejected

``` r
predict_loan_status(2, 3, 'Not Graduate', 'Yes', 2548900, 345900, 14, 124, 685878, 4657900,678000654,4590000)
```

    ## [1] Approved
    ## Levels: Approved Rejected

\#plumber API

``` r
if (require("languageserver")) {
  require("languageserver")
} else {
  install.packages("languageserver", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## plumber ----
if (require("plumber")) {
  require("plumber")
} else {
  install.packages("plumber", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## caret ----
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

\#model location

``` r
loaded_loan_dataset_model_lda <- readRDS("./models/saved_loan_dataset_model_lda.rds")
```

\#model description

``` r
#* @apiTitle loan Prediction Model API

#* @apiDescription Used to predict whether a loan request  is approved or rejected.
#* 

#* @param arg_loan_id loan unique identifier
#* @param arg_no_of_dependents dependents on the loan
#* @param arg_education level of education
#* @param arg_self_employed employement status
#* @param arg_income_annum annual income
#* @param arg_loan_amount amount of loan needed
#* @param arg_loan_term loan term
#* @param arg_cibil_score cibil score
#* @param arg_residential_assets_value residence value
#* @param arg_commercial_assets_value commercial value
#* @param arg_luxury_assets_value luxury value
#* @param arg_bank_asset_value bank value


#* @get /loan_status
```

\#prediction using data framework

``` r
predict_loan_status <- function(arg_loan_id, arg_no_of_dependents, arg_education, arg_self_employed, arg_income_annum,
                                arg_loan_amount, arg_loan_term, arg_cibil_score, arg_residential_assets_value,
                                arg_commercial_assets_value, arg_luxury_assets_value, arg_bank_asset_value) {
  # Create a data frame using the arguments
  to_be_predicted <- data.frame(loan_id = as.numeric(arg_loan_id),
                                no_of_dependents = as.numeric(arg_no_of_dependents),
                                education = as.factor(arg_education),
                                self_employed = as.factor(arg_self_employed),
                                income_annum = as.numeric(arg_income_annum),
                                loan_amount = as.numeric(arg_loan_amount),
                                loan_term = as.numeric(arg_loan_term),
                                cibil_score = as.numeric(arg_cibil_score),
                                residential_assets_value = as.numeric(arg_residential_assets_value),
                                commercial_assets_value = as.numeric(arg_commercial_assets_value),
                                luxury_assets_value = as.numeric(arg_luxury_assets_value),
                                bank_asset_value = as.numeric(arg_bank_asset_value))
  # Make a prediction based on the data frame
  predict(loaded_loan_dataset_model_lda, to_be_predicted)
}
```

\#Run Plumber API

``` r
if (require("languageserver")) {
  require("languageserver")
} else {
  install.packages("languageserver", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

# STEP 1. Install and load the required packages ----
## plumber ----
if (require("plumber")) {
  require("plumber")
} else {
  install.packages("plumber", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

``` r
#process plumber API
#api <- plumber::plumb("project Plumber API.R")
#run API on specific port
#api$run(host = "127.0.0.1", port = 5022)
```
