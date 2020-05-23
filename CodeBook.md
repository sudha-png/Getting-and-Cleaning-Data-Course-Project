# CodeBook 
#### Data Set Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

#### Including Files
- `features_info.txt`: Shows information about the variables used on the feature vector.
- `features.txt`: List of all features.
- `activity_labels.txt': Links the class labels with their activity name.
- `train/X_train.txt`: Training set.
- `train/y_train.txt`: Training labels.
- `test/X_test.txt`: Test set.
- `test/y_test.txt`: Test labels.

#### Detailed Steps
* Merges the training and the test sets to create one data set.
  + Get features and activity labels as character vectors:
    - `features` contains the second column of `features.txt` and rename to column as "features"
    - `activities` contains the second column of `activity_labels.txt` and  and rename the column as "activity"
  + Read test files and rename de columns
    - `subject_test` reads the txt `subject_test.txt` and rename the column as "subject"
    - `x_train` read the .txt document `test/X_train.txt` and rename the columns as `features`
    - `y_train` <- read the .txt document `test/y_train.txt` and rename the column as "activity"
  + Read train files and rename de columns
    - `subject_train` reads the txt `subject_train.txt` and rename the column as "subject"
    - `x_test` read the .txt document `test/X_test.txt` and rename to column as "features"
    - `y_test` <- read the .txt document `test/y_test.txt` and rename the column as "activity"
  + Create test and train data frame
    - Whith `cbind` two data frames are created `test` which contains all the test files and `train` which contains all the train files 
  + Create one data set by merging test a train data frames whith `rbind`
* Extracts only the measurements on the mean and standard deviation for each measurement.
  + Find the number of columns that matches either mean or std, a variable `mean_std` is created by using `grep`
* Uses descriptive activity names to name the activities in the data set
  + `HARdata$activity` is rename with the indeces of the character vector whithin `activities`
* Appropriately labels the data set with descriptive activity names.
  + All `t` at the beginning of the column names is replaced by `time`
  + All `f` at the beginning of the column names is replaced by `frequency`
  + All `Freq` in the  middle of the column names is replaced by `Frequency`
  + All `Acc` in the  middle of the column names is replaced by `Accelerometer`
  + All `Gyro` in the  middle of the column names is replaced by `Gyroscope`
  + All `Mag` in the  middle of the column names is replaced by `Magnitude`
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  + Group the data set by activity and subject. A new data frame called `HARdata2` is created
  + `HARdata2` is exported as `HARdata.txt`
