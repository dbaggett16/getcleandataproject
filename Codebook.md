---
title: "Codebook.md"
author: "David S. Baggett"
date: "November 6, 2016"
output: markdown document
---

# Codebook for Getting and Cleaning Data Peer Review Project

## Variable Names

### subject (integer)
  Person performing each activity is identified by an integer.  There is a total of 60 subjects identified in the the training and test data sets.
### activity (character)
  There is a total of six(6) activities.  They are listed below.
#### standing
  Subject is standing stationary.  Activity name was changed from STANDING consistency.
#### walking
  Subject is walking on level surface.  Activity name was changed from WALKING for consistency.
#### walkingup
  Subject is walking up multiple flights of stairs.  Activity name was changed from WALKING_UP to remove underscore.
#### walkingdown
  Subject is walking down multiple flights of stairs.  Activity name was changed from WALKING_DOWN to remove underscore. 
#### sitting
  Subject is sitting stationary.  Activity name was changed for consistency.
#### laying
  Subject is laying down stationaary.  Activity name was changed from LAYING for consistency.

### mean.fv{1:561} (numeric)
  These variables summarize each activity for each subject.  The mean of feature vector(fv) element {1:561} is reported for each subject and activity group. 
