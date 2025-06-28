# Getting and Cleaning Data Course Project
#
# The purpose of this script is to collect, work with, and clean a data set.
# The goal is to prepare tidy data that can be used for later analysis.
#
# This script does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with
#    the average of each variable for each activity and each subject.

# Install and load required packages if they are not already installed.
if (!require("dplyr")) {
  install.packages("dplyr")
}
library(dplyr)

# --- Step 1: Download and Unzip the Dataset ---

# Define the file URL and the destination directory
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destDir <- "UCI HAR Dataset"
destFile <- "dataset.zip"

# Download the file if it doesn't already exist
if (!file.exists(destFile)) {
  download.file(fileUrl, destFile, method = "curl")
}

# Unzip the file if the directory doesn't already exist
if (!dir.exists(destDir)) {
  unzip(destFile)
}

# --- Step 2: Load the Data into R ---

# Read the features and activity labels
features <- read.table(file.path(destDir, "features.txt"), col.names = c("n", "functions"))
activity_labels <- read.table(file.path(destDir, "activity_labels.txt"), col.names = c("code", "activity"))

# Read the training data
subject_train <- read.table(file.path(destDir, "train", "subject_train.txt"), col.names = "subject")
x_train <- read.table(file.path(destDir, "train", "X_train.txt"), col.names = features$functions)
y_train <- read.table(file.path(destDir, "train", "y_train.txt"), col.names = "code")

# Read the test data
subject_test <- read.table(file.path(destDir, "test", "subject_test.txt"), col.names = "subject")
x_test <- read.table(file.path(destDir, "test", "X_test.txt"), col.names = features$functions)
y_test <- read.table(file.path(destDir, "test", "y_test.txt"), col.names = "code")


# --- Step 3: Merge the Training and Test Sets ---

# Combine the rows for each of the data types
X_data <- rbind(x_train, x_test)
Y_data <- rbind(y_train, y_test)
Subject_data <- rbind(subject_train, subject_test)

# Combine all into one merged data set
merged_data <- cbind(Subject_data, Y_data, X_data)


# --- Step 4: Extract Mean and Standard Deviation Measurements ---

# Select columns that have "mean" or "std" in their names, along with subject and code
tidy_data <- merged_data %>%
  select(subject, code, contains("mean"), contains("std"))


# --- Step 5: Use Descriptive Activity Names ---

# Replace the numeric activity codes with descriptive names from activity_labels
tidy_data$code <- activity_labels[tidy_data$code, 2]


# --- Step 6: Appropriately Label the Data Set with Descriptive Variable Names ---

# Rename the 'code' column to 'activity'
names(tidy_data)[2] = "activity"

# Clean up the variable names
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("tBody", "TimeBody", names(tidy_data))
names(tidy_data) <- gsub("-mean()", "Mean", names(tidy_data), ignore.case = TRUE)
names(tidy_data) <- gsub("-std()", "STD", names(tidy_data), ignore.case = TRUE)
names(tidy_data) <- gsub("-freq()", "Frequency", names(tidy_data), ignore.case = TRUE)
names(tidy_data) <- gsub("angle", "Angle", names(tidy_data))
names(tidy_data) <- gsub("gravity", "Gravity", names(tidy_data))
# Remove periods that were introduced in the column names
names(tidy_data) <- gsub("\\.", "", names(tidy_data))


# --- Step 7: Create a Second Tidy Data Set with Averages ---

# Group by subject and activity, then summarize each variable to get its mean
final_tidy_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Write the final tidy data set to a text file
write.table(final_tidy_data, "FinalTidyData.txt", row.name = FALSE)

# --- Script End ---
# You can view the final tidy data set by loading 'FinalTidyData.txt' into R.
# For example: final_data <- read.table("FinalTidyData.txt", header = TRUE)
# View(final_data)

print("Script finished. 'FinalTidyData.txt' has been created.")
