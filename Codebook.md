---
title: "Codebook.md"
author: "David S. Baggett"
date: "November 10, 2016"
output: html_document
---

# Codebook for tidydata file

## Variable Names
All variable names were changed to lowercase and special characters like underscores, commas, parentheses, and dashes were removed. Numeric identifyers were replaced with descriptive names for activities.  Subject identifiers were left as integers, because no additional information was available.  

### subject (integer)
  Person performing each activity is identified by an integer.  There are a total of thirty(30) subjects identified in the the training and test data sets.
### activity (character)
  There are a total of six(6) activities.  They are listed below.
#### standing
  Subject is standing stationary.  Activity name was changed from STANDING for consistency.
#### walking
  Subject is walking on level surface.  Activity name was changed from WALKING for consistency.
#### walkingup
  Subject is walking up multiple flights of stairs.  Activity name was changed from WALKING_UP to remove underscore.
#### walkingdown
  Subject is walking down multiple flights of stairs.  Activity name was changed from WALKING_DOWN to remove underscore. 
#### sitting
  Subject is sitting stationary.  Activity name was changed from SITTING for consistency.
#### laying
  Subject is laying down stationaary.  Activity name was changed from LAYING for consistency.

### Feature Variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of mean and standard deviation variables that were estimated from these signals are:   

mean(): Mean value  
std(): Standard deviation  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

### Complete list of variables  

1 subject  
2 activity  
3 tBodyAccstdX  
4 tBodyAccstdY  
5 tBodyAccstdZ  
6 tGravityAccstdX  
7 tGravityAccstdY  
8 tGravityAccstdZ  
9 tBodyAccJerkstdX  
10 tBodyAccJerkstdY  
11 tBodyAccJerkstdZ  
12 tBodyGyrostdX  
13 tBodyGyrostdY  
14 tBodyGyrostdZ  
15 tBodyGyroJerkstdX  
16 tBodyGyroJerkstdY  
17 tBodyGyroJerkstdZ  
18 tBodyAccMagstd  
19 tGravityAccMagstd  
20 tBodyAccJerkMagstd  
21 tBodyGyroMagstd  
22 tBodyGyroJerkMagstd  
23 fBodyAccstdX  
24 fBodyAccstdY  
25 fBodyAccstdZ  
26 fBodyAccJerkstdX  
27 fBodyAccJerkstdY  
28 fBodyAccJerkstdZ  
29 fBodyGyrostdX  
30 fBodyGyrostdY  
31 fBodyGyrostdZ  
32 fBodyAccMagstd  
33 fBodyBodyAccJerkMagstd  
34 fBodyBodyGyroMagstd  
35 fBodyBodyGyroJerkMagstd  
36 tBodyAccmeanX  
37 tBodyAccmeanY  
38 tBodyAccmeanZ  
39 tGravityAccmeanX  
40 tGravityAccmeanY  
41 tGravityAccmeanZ  
42 tBodyAccJerkmeanX  
43 tBodyAccJerkmeanY  
44 tBodyAccJerkmeanZ  
45 tBodyGyromeanX  
46 tBodyGyromeanY  
47 tBodyGyromeanZ  
48 tBodyGyroJerkmeanX  
49 tBodyGyroJerkmeanY  
50 tBodyGyroJerkmeanZ  
51 tBodyAccMagmean  
52 tGravityAccMagmean  
53 tBodyAccJerkMagmean  
54 tBodyGyroMagmean  
55 tBodyGyroJerkMagmean  
56 fBodyAccmeanX  
57 fBodyAccmeanY  
58 fBodyAccmeanZ  
59 fBodyAccmeanFreqX  
60 fBodyAccmeanFreqY  
61 fBodyAccmeanFreqZ  
62 fBodyAccJerkmeanX  
63 fBodyAccJerkmeanY  
64 fBodyAccJerkmeanZ  
65 fBodyAccJerkmeanFreqX  
66 fBodyAccJerkmeanFreqY  
67 fBodyAccJerkmeanFreqZ  
68 fBodyGyromeanX  
69 fBodyGyromeanY  
70 fBodyGyromeanZ  
71 fBodyGyromeanFreqX  
72 fBodyGyromeanFreqY  
73 fBodyGyromeanFreqZ  
74 fBodyAccMagmean  
75 fBodyAccMagmeanFreq  
76 fBodyBodyAccJerkMagmean  
77 fBodyBodyAccJerkMagmeanFreq  
78 fBodyBodyGyroMagmean  
79 fBodyBodyGyroMagmeanFreq  
80 fBodyBodyGyroJerkMagmean  
81 fBodyBodyGyroJerkMagmeanFreq  
82 angletBodyAccMeangravity  
83 angletBodyAccJerkMeangravityMean  
84 angletBodyGyroMeangravityMean  
85 angletBodyGyroJerkMeangravityMean  
86 angleXgravityMean  
87 angleYgravityMean  
88 angleZgravityMean  