# Getting and Cleaning Data

#### Review criteria
1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.

#### Getting and Cleaning Data Course Project
The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

#### Content 
  * `CodeBook.md` describes the varibales and the procedure along with `run_analysis.R` 
  * `run_analysis.R` This is a R script that performs the following steps: 
    + Merges the training and the test sets to create one data set.
    + Extracts only the measurements on the mean and standard deviation for each measurement.
    + Uses descriptive activity names to name the activities in the data set
    + Appropriately labels the data set with descriptive variable names.
    + From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  * `HARdata.txt`: Exported final data set created in the final step. 
  
#### Data from
[Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
