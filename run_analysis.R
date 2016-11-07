# R Script written by David S. Baggett for the Getting and Cleaning Data Course
run_analysis <- function(directory = 0, overwrite = FALSE, dlmethod = 0)
{
# Download and extract files from ZIP archive.
  if (directory == 0) {stop("You must call run_analysis(directory, overwrite) with a valid directory name.")}
  if (dir.exists(directory) && overwrite != TRUE) {stop("Warning: Dirctory exists! Choose a different directory or call run_analysis(directory, overwrite) with overwrite = TRUE.")}
  datafile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  temp <- tempfile()
# set file download method
  if (dlmethod != 0) {dlmethod <- dlmethod}
  else if (Sys.info()["sysname"] == "Darwin") {dlmethod <- "curl"} else  {dlmethod <- "auto"}
  message("Downloading data ZIP archive...")
  download.file(url=datafile, destfile=temp, method=dlmethod, quiet= TRUE)
  message("Extracting files to ", directory)
  unzip (temp, exdir = directory)
message("Skipping file dowload...")
  unlink(temp)
# Merge training and test data to create one data set.
  rootdir <- paste(directory, "/UCI HAR Dataset", sep="")
  traindir <- paste(rootdir, "/train", sep="")
  testdir <- paste(rootdir, "/test", sep="")
  message("Getting extracted data...")
  X_test <<- read.table(paste(testdir, "/X_test.txt", sep = ""))
  Y_test <<- read.table(paste(testdir, "/y_test.txt", sep = ""))
  SubjectTest <<- read.table(paste(testdir, "/subject_test.txt", sep = ""))
  X_train <<- read.table(paste(traindir, "/X_train.txt", sep = ""))
  Y_train <<- read.table(paste(traindir, "/y_train.txt", sep = ""))
  SubjectTrain <<- read.table(paste(traindir, "/subject_train.txt", sep = ""))
  message("Merging extracted data...")
  ctrain <<- cbind(SubjectTrain, Y_train, X_train)
  ctest <<- cbind(SubjectTest, Y_test, X_test)
  traintest <<- rbind(ctrain, ctest)

# Create descriptive variable names.
  names(traintest) <<- c("subject", "activity", sprintf("fv%d", 1:561))

# Rename activities with more descriptive names.
activities <- c("walking", "walkingup", "walkingdown", "sitting", "standing", "laying")
for (i in 1:6){
  traintest$activity[which(traintest$activity == i)]<<-activities[i]
}
# Extract mean and standard deviation for each measurement.
  mutate(traintest, mean[,3:563])

# Create a second, independent tidy data set with the average of each variable for each activity and each subject.
}
