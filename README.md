# Getting and Cleaning Data, Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

##data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The repository contains following files:
##Readme.md:
Description of the entire project

##run_analysis.R:
Ths file has code to 
1. download data from the given link
2. Uzip the downloaded file
3. Merges the training and the test sets to create one data set.
4. Extracts only the measurements on the mean and standard deviation for each      measurement.
5. Uses descriptive activity names to name the activities in the data set
6. Appropriately labels the data set with descriptive variable names.
7. From the data set in step 6, creates a second, independent tidy data set with   the average of each variable for each activity and each subject.

##Variables and functions in the Code:
functions used in the code:

######download.file(download_from, dowloaded_file) 
download the zip file from the download link
######unzip(dowloaded_file) 
unzip the file
######read_data <- function (file_name,col_names = NULL) 
Create a function to read data from features.txt and convert it into a Data Frame
######getdata <- function(type, features) 
read data and build database by merging the data of test and training respectively
######saveresults <- function (data,name) 
funciton to save the results in .csv format
######rbind(train, test) 
Merge Test and Traning data
######final_data$activity <- factor(final_data$activity, levels=activity_labels$V1, labels=activity_labels$V2) 
label the contents of activity as per the labels mentioned in activitie_labels.txt
######ddply() 
calculate mean and standard deviation of respective elements.
######colnames(tidy_dataset)[-c(1:2)] 
change column names descriptively

Variables used in the code:
######download_from 
the download link is saved in this variable 
######dowloaded_file 
the name of the file downloaded 
######final_data 
the merged data 
######activity_labels 
labels of activity variable as tank from activity_labels.txt 
######tidy_dataset 
data frame containing tidy data

##tidy_dataset.csv:
desired output saved in csv format

##Codebook.md:
contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.


