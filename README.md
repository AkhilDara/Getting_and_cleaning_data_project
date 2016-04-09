# Getting and Cleaning Data, Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

##data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The repository contis following files:
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

##tidy_dataset.csv:
desired output saved in csv format

##Codebook.md:
contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
