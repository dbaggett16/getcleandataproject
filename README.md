---
title: "README.md"
author: "David S. Baggett"
date: "November 7, 2016"
output: html_document
---

# README - Getting and Cleaning Data: Final Project

## Overview
The purpose of this project is to demonstrate how a dataset can be downloaded and cleaned using an R script.  The dataset will be dowloaded and extracted from a ZIP archive.  Files will be aggregated and read into R.  Variables will be renamed and a file containing a new tidy dataset derived from the original files will be generated.  This new dataset can be used for further analysis.

## Project Files
**README.md** - This file.  Describes the project and how to excute the scripts.  
**Codebook.md** - Contains detailed description of the dataset and information regarding any transformations or modifications that were done to produce the tidy dataset.  
**run_analyis.R** - The script that performs all operations including downloading the data, tranforming and saving as a tidy dataset in a new file.  
**tidydata** - The resulting tidy data file that can be imported using read.table('[your directory]/tidydata')

## Prerequisite
This script requires the dplyr library.  If the script finds dplyr installed, it will attempt to load the library.  Execution will stop if dplyr is not installed.  

## Getting Started

Download the 'run_analysis.R' file in the following git repository.  

[https://github.com/dbaggett16/getcleandataproject]  

Load the run_analysis function using source('run_analysis.R')
Assuming the R file is in your current working directory.

### Usage
run_analysis(directory, overwrite, dlmethod)

EXAMPLES: |
----------|----------------------------------------------------
          |run_analysis("mynewdirectory")  
          |run_analysis("myexistingdirectory", TRUE)  
          |run_analysis("myexistingdirectory", TRUE, "libcurl")  

**directory** - You must specify a directory name (in quotes) for the extracted data files. NO DEFAULT

**overwrite** - If the directory you specified already exists.  The script will overwrite it without prompting when this argument is set to TRUE.  Execution will stop if the directory already exists and this value is not set to TRUE. DEFAULT: FALSE

**dlmethod** - Some systems require a specific download method.  The script will detect Mac OSX as "Darwin" and set the method to "curl"  Otherwise the method will be set to auto.  DEFAULT: "auto"

### Normal Output

Downloading data ZIP archive...  
Extracting files to {directory}  
Getting extracted data...  
Merging extracted data...  
Creating descriptive variable names...  
Renaming activities...  
Aggregating data by Subject and Activity.  
Creating tidy data file.  
Completed Successfully: Type mytidydata <- read.table('[directory]/tidydata') to import tidy data file grouped by subject and activity.  

### Troubleshooting

#### Did not specify a valid directory
>Error in run_analysis() : 
  You must call run_analysis(directory, overwrite) with a valid directory name.
  
#### You must put the directory name in quotes
>Error in run_analysis(mydirectory) : object 'mydirectory' not found

#### Specify a new directory or set overwrite to TRUE
>Error in run_analysis("dataextract") : 
  Warning: Dirctory exists! Choose a different directory or call run_analysis(directory, overwrite, dlmethod) with overwrite = TRUE.

#### Overwrite (second argument) is TRUE or FALSE
>Error in run_analysis("dataextract", "YES") : 
  Warning: Dirctory exists! Choose a different directory or call run_analysis(directory, overwrite, dlmethod) with overwrite = TRUE.

#### Make sure the dplyr package is installed
>Error in run_analysis("dataextract") :
  Please install 'dplyr' package before running this script