# R Script written by David S. Baggett for the Getting and Cleaning Data Course
run_analysis <- function(directory = 0, overwrite = FALSE, dlmethod = 0)
{
# Checking for required packages and arguments
  if (!is.element("dplyr", installed.packages())) {stop("Please install 'dplyr' package before running this script")}
  library(dplyr)
  
  if (!dir.exists("UCI HAR Dataset")) {
  if (directory == 0) {stop("If 'UCI HAR Dataset' does not exist in your working directory, you must call run_analysis(directory, overwrite) with a valid directory name.")}
  if (dir.exists(directory) && overwrite != TRUE) {stop("Warning: Dirctory exists! Choose a different directory or call run_analysis(directory, overwrite) with overwrite = TRUE.")}
  rootdir <- paste(directory, "/UCI HAR Dataset", sep="")
  datafile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  temp <- tempfile()
# Set file download method (default: curl for mac, auto for others)
  if (dlmethod != 0) {dlmethod <- dlmethod}
  else if (Sys.info()["sysname"] == "Darwin") {dlmethod <- "curl"} else  {dlmethod <- "auto"}
  
# Download and extract files from ZIP archive.
  message("Downloading data ZIP archive...")
  download.file(url=datafile, destfile=temp, method=dlmethod, quiet= TRUE)
  message("Extracting files to ", directory)
  unzip (temp, exdir = directory)
  unlink(temp)
  }
  else if (dir.exists("UCI HAR Dataset")){rootdir <- "UCI HAR Dataset"}
  
# Merge training and test data to create one data set.
  traindir <- paste(rootdir, "/train", sep="")
  testdir <- paste(rootdir, "/test", sep="")
  message("Getting extracted data...")
  X_test <- read.table(paste(testdir, "/X_test.txt", sep = ""))
  Y_test <- read.table(paste(testdir, "/y_test.txt", sep = ""))
  SubjectTest <- read.table(paste(testdir, "/subject_test.txt", sep = ""))
  X_train <- read.table(paste(traindir, "/X_train.txt", sep = ""))
  Y_train <- read.table(paste(traindir, "/y_train.txt", sep = ""))
  SubjectTrain <- read.table(paste(traindir, "/subject_train.txt", sep = ""))
  features <- read.table(paste(rootdir, "/features.txt", sep = ""))
  message("Merging extracted data...")
  ctrain <- cbind(SubjectTrain, Y_train, X_train)
  ctest <- cbind(SubjectTest, Y_test, X_test)
  traintest <- rbind(ctrain, ctest)
  
# Create descriptive variable names
  message("Creating descriptive variable names...")
  featurenames <- as.character(features[1:561, 2])
  cnames <- as.character(c("subject","activity"))
  cnames <- append(cnames, as.character(features[1:561,2]))
  cnames <- gsub("-","", cnames, fixed = TRUE)
  cnames <- gsub("(","", cnames, fixed = TRUE)
  cnames <- gsub(")","", cnames, fixed = TRUE)
  cnames <- gsub(",","", cnames, fixed = TRUE)
  names(traintest) <- cnames

# Rename activities with more descriptive names.
  message("Renaming activities...")
  activities <- c("walking", "walkingup", "walkingdown", "sitting", "standing", "laying")
    for (i in 1:6){
      traintest$activity[which(traintest$activity == i)]<-activities[i]
  }

# Extract mean and standard deviation for each measurement.
  message("Extracting mean and standard deviation for each measurement.")
  extractdata <- data.frame(traintest)
  tidydata <- select(extractdata, 1:2, contains("std"), contains("mean"))

# Create a second, independent tidy data set with the average of each variable for each activity and each subject.
  message("Creating tidy data file.")
  write.table(tidydata, file = paste(rootdir, "/tidydata.txt", sep = ""))

# Output ending message and tidydata file location  
  endingmessage <- paste("Completed Successfully: Type mytidydata <- read.table('", rootdir, "/tidydata.txt') to import tidy data file grouped by subject and activity.", sep = "")
  message(endingmessage)
}