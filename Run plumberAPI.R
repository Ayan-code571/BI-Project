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

#process plumber API
api <- plumber::plumb("project Plumber API.R")
#run API on specific port
api$run(host = "127.0.0.1", port = 5022)
