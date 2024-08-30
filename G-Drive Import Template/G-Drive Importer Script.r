# The following code chunk is designed to authenticate, import and read a dataset originating from a GDrive account.

# Setting the CRAN mirror. This allows it to work with automation and avoid the "cannot install library" errors.

options(repos = c(CRAN = "https://cran.r-project.org"))

# Loading the required libraries:

install.packages("googledrive")
install.packages("googlesheets4")
install.packages("openxlsx")

# This next bit loads the needed libraries installed.:

library(googledrive)
library(googlesheets4)
library(openxlsx)

# The next piece of R code is a function that clears cached credentials from previous authentication, then re-authenticates which requires that the user confirm the permissions.

gdrive_dataset_pull <- function(){
  
  drive_deauth()

  drive_auth(email = "ENTER_EMAIL_HERE", cache = FALSE, scopes = "drive.readonly")
  
# The next bit of R code defines variables for the local destination path where the downloaded file will go to.:

  dest_file <- "ENTER-ABSOLUTE-PATH-HERE/test.xlsx"

# Finally, variables to define the URL where the file can be found, another to read the dataset file and finally, the write.xlsx function to actually write the data locally.

  dataset_file_id <- "ENTER-URL-HERE"
  dataset_raw <- read_sheet(dataset_file_id)
  
  write.xlsx(dataset_raw, dest_file)


}

# This just calls and executes the entire function.:

gdrive_dataset_pull()
