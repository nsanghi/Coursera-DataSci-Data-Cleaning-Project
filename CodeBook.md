## Coursera Data Cleaning Course Project

### Description

Details of modifications made to original data used in the course project

### Original Source

A complete description of the data can be found at
[UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The original data can be found at <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

#### For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### The dataset includes the following files:
- `README.txt`
- `features_info.txt`: Shows information about the variables used on the feature vector.
- `features.txt`: List of all features.
- `activity_labels.txt`: Links the class labels with their activity name.
- `train/X_train.txt`: Training set.
- `train/y_train.txt`: Training labels.
- `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample.
- `test/X_test.txt`: Test set.
- `test/y_test.txt`: Test labels.
- `test/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. 

### Step 1 of Analysis - Merges the training and the test data set
The data from original source is extracted in a directory named "dataset". The script is run from a folder which is sibling to the `dataset` folder.

Following files are read from the original data:

- `../dataset/features.txt`
- `../dataset/activity_labels.txt`
- `../dataset/train/X_train.txt`
- `../dataset/train/y_train.txt`
- `../dataset/train/subject_train.txt`
- `../dataset/test/X_test.txt`
- `../dataset/test/y_test.txt`
- `../dataset/test/subject_test.txt`

The column names are set properly and then data is merged to create a single dataset. This is stored in a variable named `all_data`

### Step 2 of Analysis - Extracts only the measurements on the mean and standard deviation
The data is subset on columns to extract only thoese measurement columns with represent mean or standard deviation. Other columns such as activity_id and subject_id are also retained. This data is stored in a variable named `final_data`

### Step 3 of Analysis - Uses descriptive activity names
Added descriptive activity names by merging the data with the file `activity_labels`

### Step 4 of Analysis - Appropriately labels the data set
In this step, column names are tarnsformed to make them more descriptive. This is done using `gsub` function.

### Step 5 of Analysis - Tidy the data and create summary
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. The data is then exported into a tab delimited file named `tidyData.txt`

---

#### License:
The original license under which this data was used is given below:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.