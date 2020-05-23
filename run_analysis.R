library(dplyr)

#1) Merges the training and the test sets to create one data set.
#Get features and activity labels as character vectors
features <- read.table("./features.txt")[,2]
activities <- read.table("./activity_labels.txt")[,2]

#Read test files and rename de columns
subject_test <- read.table("./test/subject_test.txt", col.names="subject")
x_test <- read.table("./test/X_test.txt",col.names=features)
y_test <- read.table("./test/y_test.txt",col.names="activity")

#Read train files and rename de columns
subject_train <- read.table("./train/subject_train.txt",col.names="subject") 
x_train <- read.table("./train/X_train.txt",col.names=features)
y_train <- read.table("./train/y_train.txt",col.names="activity")

#Create test and train data frame
test <- cbind(subject_test,y_test,x_test)
train <- cbind(subject_train,y_train,x_train)

#Add a new column to each data frame called set
test <- mutate(test,set="TEST")
train <- mutate(train,set="TRAIN")

#Create one data set by merging test a train data frames
HARdata <- rbind(test,train)

#2) Extract only the measurements on the mean and standard deviation for each measurement.
# Find the number of columns that matches either mean or std  
mean_std <- grep("[Mm]ean|[Ss]td",colnames(HARdata))
HARdata <- HARdata %>% select(subject,activity,set,all_of(mean_std))

#3) Uses descriptive activity names to name the activities in the data set
HARdata$activity <- activities[HARdata$activity]

#4) Appropriately labels the data set with descriptive variable names.
names(HARdata) <- gsub(pattern="^t",replacement="time",names(HARdata))
names(HARdata) <- gsub(pattern="^f",replacement="frequency",names(HARdata))
names(HARdata) <- gsub(pattern="Freq",replacement="Frequency",names(HARdata))
names(HARdata) <- gsub(pattern="Acc",replacement="Accelerometer",names(HARdata))
names(HARdata) <- gsub(pattern="Gyro",replacement="Gyroscope",names(HARdata))
names(HARdata) <- gsub(pattern="Mag",replacement="Magnitude",names(HARdata))

#5) From the data set in step 4, creates a second, independent tidy data set with 
#   the average of each variable for each activity and each subject.

#Remove the column set of the second tidy data set
HARdata2 <- HARdata[,-3]
#Group the data set by activity and subject
HARdata2 <- HARdata2 %>% group_by(subject,activity) %>% summarise_all(funs(mean)) 

write.table(HARdata2, file = "HARdata.txt",row.name=FALSE)
