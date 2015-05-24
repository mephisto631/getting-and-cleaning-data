# getting-and-cleaning-data
This is a repository for any and all code written for the Getting and Cleaning Data Coursera course through Johns Hopkins University.

## What this script does: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.The resulting table is put into a txt file named: "data_set_with_the_averages.txt"


## How to run the script
* Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local drive, say C:\Users\yourname\Documents\R\
* Put run_analysis.R into C:\Users\yourname\Documents\R
* In RStudio: setwd("C:\\Users\\yourname\\Documents\\R\\"), followed by: source("run_analysis.R")
