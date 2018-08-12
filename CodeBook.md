
## 1. Data
Data the the project was obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Full Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## 2. R script
Source file "run_analysis.R" perform 7 following steps:
1. Downloads and extracts data into working directory   
2. Reads Data    
    2.1. Reads Train Data 
    2.2. Reads Test Data  
    2.3. Reads Feature Data
    2.4. Reads Activity Data
3. Assigns meaningful column names to data
  3.1 Assigns meaningful column names for train data 
  3.2 Assigns meaningful column names for train data 
  3.3 Assigns meaningful column names for activity data
4. Merges the training and the test sets to create one data set
5. Extracts only the measurements on the mean and standard deviation for each measurement  
6. Uses descriptive activity names to name the activities in the data set
7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
  7.1. Averages of each variable for each activity and each subject and order the result by subjectId and activityId
  7.2. Writes the tidy data in tidyData.txt  

## 3. Variables:   
* `x_train`, `y_train`, `subject_train` contain the original train data.
* `x_test`, `y_test`, `subject_test` contain the original test data.
* `feature` contains the feature names.
* `activity_labels` contains activity ids and activity names
* `final_data` is created by merging train and test data and then extractinf only the measurements on the mean and standard deviation for each measurement
* `final_data_with_labels` is the result when merging final_data and activity_labels by activityId
* `tidy_data` is the data set with the average of each variable for each activity and each subject