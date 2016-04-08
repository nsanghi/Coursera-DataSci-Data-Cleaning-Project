###############################################################################
#
# Coursera Specialization - DataScience by John Hopkins
# Data Cleaning Course Project
#
# run_analysis.R
# This script will perform the steps as required in the coruse project.
# The data is from URL 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 
# The steps are 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
# 
# NOTE: The steps will not be performed in the strict order as enumerated above
#
# The data from URL is downloaded and kept in a directory named "dataset" which
# is sibling to the directory from where this script is run
###############################################################################

# read train and test sets
# read features X_train and X_test
features_train <- read.table("./UCI\ HAR\ Dataset/train/X_train.txt", header = FALSE)
features_test <- read.table("./UCI\ HAR\ Dataset/test/X_test.txt", header = FALSE)

# read labels y_train and y_test
labels_train <- read.table("./UCI\ HAR\ Dataset/train/y_train.txt", header = FALSE)
labels_test <-  read.table("./UCI\ HAR\ Dataset/test/y_test.txt", header = FALSE)

# read subject ids subject_train and subject_test
subjects_train <- read.table("./UCI\ HAR\ Dataset/train/subject_train.txt", header = FALSE)
subjects_test <- read.table("./UCI\ HAR\ Dataset/test/subject_test.txt", header = FALSE)


# Step 4- name the variables appropriately

# first load the names of the features
feature_names <- read.table("./UCI\ HAR\ Dataset/features.txt", header = FALSE)

# set the names of features
colnames(features_train) <- feature_names[,2] # set the name of the features
colnames(features_test) <- feature_names[,2] # set the name of the features

# set the label field name
colnames(labels_train) <- "activity_id"
colnames(labels_test) <- "activity_id"

# set the subject field name
colnames(subjects_train) <- "subject_id"
colnames(subjects_test) <- "subject_id"

# merge train data from three sources into a single dataframe
train_data <- cbind(features_train,subjects_train, labels_train)
test_data <- cbind(features_test,subjects_test, labels_test)

# Step 1 - Merges the training and the test sets to create one data set.
all_data <- rbind(train_data, test_data)

# Step 2 - Extracts only the measurements on the mean and 
#          standard deviation for each measurement.
column_names <- colnames(all_data)

selected_cols <- column_names[grepl("mean\\(\\)", column_names) 
                              | grepl("std\\(\\)", column_names) 
                              | grepl("subject_id", column_names)
                              | grepl("activity_id", column_names)]

final_data <- all_data[ ,selected_cols]

# Step 3 - Uses descriptive activity names to name the activities in the data set
# read description activity name
activity_labels <- read.table("./UCI\ HAR\ Dataset/activity_labels.txt", header = FALSE)
colnames(activity_labels) <- c("activity_id", "activity_type")

# merge final_data with activity_labels
final_data <- merge(activity_labels, final_data, by="activity_id")


# Step 4-Appropriately labels the data set with descriptive variable names. 
column_names <- colnames(final_data)

for (i in 1:length(column_names)) {
  column_names[i] <- gsub("\\()","",column_names[i])
  column_names[i] <- gsub("-std$","_StdDev",column_names[i])
  column_names[i] <- gsub("-std-","_StdDev_",column_names[i])
  column_names[i] <- gsub("-mean$","_Mean",column_names[i])
  column_names[i] <- gsub("-mean-","_Mean_",column_names[i])
  column_names[i] <- gsub("^t","time",column_names[i])
  column_names[i] <- gsub("^f","freq",column_names[i])
  column_names[i] <- gsub("Acc","Acceleration",column_names[i])
}

colnames(final_data) <- column_names

# Step 5 From the data set in step 4, creates a second, independent tidy data 
#set with the average of each variable for each activity and each subject.
library(dplyr)

# select data without the activity type (i.e. activity descriptions)
data_step5 <- select(final_data, -activity_type)
#group data by activity_id and subject_id
grouped_data <- group_by(data_step5, activity_id, subject_id)
#find mean for each column of the grouped data
mean_grouped_data <- summarise_each(grouped_data, funs(mean))
# add back activity_type
mean_grouped_data <- merge(activity_labels, mean_grouped_data, by="activity_id")

# Export the tidyData set 
write.table(mean_grouped_data, './tidyData.txt',row.names=FALSE,sep='\t');


