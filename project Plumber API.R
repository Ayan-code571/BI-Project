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

loaded_loan_dataset_model_lda <- readRDS("./models/saved_loan_dataset_model_lda.rds")

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
