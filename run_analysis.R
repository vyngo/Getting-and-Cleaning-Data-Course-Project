# 1. Download and extract data in working directory
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "zipDtata.zip")
unzip("zipDtata.zip")

# 2. Read data
# 2.1 Read train data
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# 2.2 Read test Data
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# 2.3. read features
features <- read.table('./UCI HAR Dataset/features.txt', stringsAsFactors = FALSE)
features <- features$V2

# 2.4. read activity labels
activity_labels = read.table('./UCI HAR Dataset/activity_labels.txt')

# 3. Create meaningful column names
colnames(x_train) <- features 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features 
colnames(y_test) <-"activityId"
colnames(subject_test) <- "subjectId"

colnames(activity_labels) <- c('activityId','activityName')

# 4. Merges the training and the test sets to create one data set.
final_data_train <- cbind(subject_train, x_train, y_train)
final_data_test <- cbind(subject_test, x_test, y_test)
final_data <- rbind(final_data_train, final_data_test)

# 5. Extracts only the measurements on the mean and standard deviation for each measurement.
col_names <- colnames(final_data)
chosen_cols <- (grepl("subjectId" , col_names) | 
                     grepl("mean" , col_names) | 
                     grepl("std" , col_names)  |
                     grepl("activityId" , col_names))

final_data <- final_data[, chosen_cols == TRUE]

#6. Uses descriptive activity names to name the activities in the data set

final_data_with_labels <- merge(final_data, activity_labels, by = "activityId", all.x = TRUE)

# 7. creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data <- aggregate(. ~subjectId + activityId, final_data_with_labels, mean)
tidy_data <- tidy_data[order(tidy_data$subjectId, tidy_data$activityId),]
write.table(tidy_data, "tidyData.txt", row.name=FALSE)
