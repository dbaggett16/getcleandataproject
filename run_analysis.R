# R Script written by David S. Baggett for the Getting and Cleaning Data Course
run_analysis <- function(directory = 0, overwrite = FALSE, dlmethod = 0)
{
# Checking for required packages and arguments
  if (!is.element("dplyr", installed.packages())) {stop("Please install 'dplyr' package before running this script")}
  library(dplyr)
  if (directory == 0) {stop("You must call run_analysis(directory, overwrite) with a valid directory name.")}
  if (dir.exists(directory) && overwrite != TRUE) {stop("Warning: Dirctory exists! Choose a different directory or call run_analysis(directory, overwrite) with overwrite = TRUE.")}
  datafile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  temp <- tempfile()
# set file download method
  if (dlmethod != 0) {dlmethod <- dlmethod}
  else if (Sys.info()["sysname"] == "Darwin") {dlmethod <- "curl"} else  {dlmethod <- "auto"}
  
# Download and extract files from ZIP archive.
  message("Downloading data ZIP archive...")
  download.file(url=datafile, destfile=temp, method=dlmethod, quiet= TRUE)
  message("Extracting files to ", directory)
  unzip (temp, exdir = directory)
  unlink(temp)
# Merge training and test data to create one data set.
  rootdir <- paste(directory, "/UCI HAR Dataset", sep="")
  traindir <- paste(rootdir, "/train", sep="")
  testdir <- paste(rootdir, "/test", sep="")
  message("Getting extracted data...")
  X_test <- read.table(paste(testdir, "/X_test.txt", sep = ""))
  Y_test <- read.table(paste(testdir, "/y_test.txt", sep = ""))
  SubjectTest <- read.table(paste(testdir, "/subject_test.txt", sep = ""))
  X_train <- read.table(paste(traindir, "/X_train.txt", sep = ""))
  Y_train <- read.table(paste(traindir, "/y_train.txt", sep = ""))
  SubjectTrain <- read.table(paste(traindir, "/subject_train.txt", sep = ""))
  message("Merging extracted data...")
  ctrain <- cbind(SubjectTrain, Y_train, X_train)
  ctest <- cbind(SubjectTest, Y_test, X_test)
  traintest <- rbind(ctrain, ctest)

# Create descriptive variable names.
  message("Creating descriptive variable names...")
  names(traintest) <- c("subject", "activity", sprintf("fv%d", 1:561))

# Rename activities with more descriptive names.
  message("Renaming activities...")
  activities <- c("walking", "walkingup", "walkingdown", "sitting", "standing", "laying")
    for (i in 1:6){
      traintest$activity[which(traintest$activity == i)]<-activities[i]
  }
# Extract mean and standard deviation for each measurement.
  message("Aggregating data by Subject and Activity.")
  aggdata <- data.frame(traintest)
  tidydata <- group_by(aggdata, subject, activity) %>% summarize_each(funs(mean), fv1:fv561)
  names(traintest) <- c("subject", "activity", sprintf("mean.fv%d", 1:561))
  
# Create a second, independent tidy data set with the average of each variable for each activity and each subject.
  message("Creating tidy data file.")
  write.table(tidydata, file = paste(directory, "/tidydata", sep = ""))

# Output ending message and tidydata file location  
  endingmessage <- paste("Completed Successfully: Type mytidydata <- read.table('", directory, "/tidydata') to import tidy data file grouped by subject and activity.", sep = "")
  message(endingmessage)
}