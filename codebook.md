Code Book for the Tidy Data Set
This code book describes the variables, the data, and any transformations or work that was performed to clean up the data for the "Getting and Cleaning Data" course project.

Source Data
The original data was collected from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on their waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz.

The source data was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data Transformation Steps
The run_analysis.R script performs the following steps to transform the raw data into the final tidy data set (FinalTidyData.txt):

Merge Data Sets: The training data set and the test data set were merged into one comprehensive data set. This involved combining the subject identifiers, activity labels, and feature measurements from both sets.

Extract Relevant Measurements: From the merged data set, only the measurements on the mean (mean()) and standard deviation (std()) for each measurement were extracted. The subject and activity columns were also kept.

Apply Descriptive Activity Names: The numeric activity labels (1-6) in the data set were replaced with descriptive names based on the activity_labels.txt file (e.g., 'WALKING', 'SITTING').

Create Descriptive Variable Names: The variable (column) names were cleaned up to be more descriptive and readable. The following transformations were applied:

Acc was replaced by Accelerometer

Gyro was replaced by Gyroscope

BodyBody was replaced by Body

Mag was replaced by Magnitude

Prefix t was replaced by Time

Prefix f was replaced by Frequency

-mean() was replaced by Mean

-std() was replaced by STD

-freq() was replaced by Frequency

Periods (.) were removed from the names.

Create Final Tidy Data Set: A second, independent tidy data set was created from the data set in the previous step. This new data set contains the average of each variable for each activity and each subject.

Variables in FinalTidyData.txt
The FinalTidyData.txt file contains 180 rows and 88 columns.

Each row represents a unique combination of a subject and an activity.

The first two columns identify the subject and the activity.

The remaining 86 columns are the average values for the extracted measurements.

Identifier Variables
subject: An integer from 1 to 30 identifying the volunteer who participated in the experiment.

activity: A character string describing the activity being performed.

LAYING

SITTING

STANDING

WALKING

WALKING_DOWNSTAIRS

WALKING_UPSTAIRS

Measurement Variables (Averages)
The following variables are the average of the mean and standard deviation measurements for each subject and activity. All values are numeric.

TimeBodyAccelerometerMeanX

TimeBodyAccelerometerMeanY

TimeBodyAccelerometerMeanZ

TimeBodyAccelerometerSTDX

TimeBodyAccelerometerSTDY

TimeBodyAccelerometerSTDZ

TimeGravityAccelerometerMeanX

TimeGravityAccelerometerMeanY

TimeGravityAccelerometerMeanZ

TimeGravityAccelerometerSTDX

TimeGravityAccelerometerSTDY

TimeGravityAccelerometerSTDZ

TimeBodyAccelerometerJerkMeanX

TimeBodyAccelerometerJerkMeanY

TimeBodyAccelerometerJerkMeanZ

TimeBodyAccelerometerJerkSTDX

TimeBodyAccelerometerJerkSTDY

TimeBodyAccelerometerJerkSTDZ

TimeBodyGyroscopeMeanX

TimeBodyGyroscopeMeanY

TimeBodyGyroscopeMeanZ

TimeBodyGyroscopeSTDX

TimeBodyGyroscopeSTDY

TimeBodyGyroscopeSTDZ

TimeBodyGyroscopeJerkMeanX

TimeBodyGyroscopeJerkMeanY

TimeBodyGyroscopeJerkMeanZ

TimeBodyGyroscopeJerkSTDX

TimeBodyGyroscopeJerkSTDY

TimeBodyGyroscopeJerkSTDZ

TimeBodyAccelerometerMagnitudeMean

TimeBodyAccelerometerMagnitudeSTD

TimeGravityAccelerometerMagnitudeMean

TimeGravityAccelerometerMagnitudeSTD

TimeBodyAccelerometerJerkMagnitudeMean

TimeBodyAccelerometerJerkMagnitudeSTD

TimeBodyGyroscopeMagnitudeMean

TimeBodyGyroscopeMagnitudeSTD

TimeBodyGyroscopeJerkMagnitudeMean

TimeBodyGyroscopeJerkMagnitudeSTD

FrequencyBodyAccelerometerMeanX

FrequencyBodyAccelerometerMeanY

FrequencyBodyAccelerometerMeanZ

FrequencyBodyAccelerometerSTDX

FrequencyBodyAccelerometerSTDY

FrequencyBodyAccelerometerSTDZ

FrequencyBodyAccelerometerMeanFreqX

FrequencyBodyAccelerometerMeanFreqY

FrequencyBodyAccelerometerMeanFreqZ

FrequencyBodyAccelerometerJerkMeanX

FrequencyBodyAccelerometerJerkMeanY

FrequencyBodyAccelerometerJerkMeanZ

FrequencyBodyAccelerometerJerkSTDX

FrequencyBodyAccelerometerJerkSTDY

FrequencyBodyAccelerometerJerkSTDZ

FrequencyBodyAccelerometerJerkMeanFreqX

FrequencyBodyAccelerometerJerkMeanFreqY

FrequencyBodyAccelerometerJerkMeanFreqZ

FrequencyBodyGyroscopeMeanX

FrequencyBodyGyroscopeMeanY

FrequencyBodyGyroscopeMeanZ

FrequencyBodyGyroscopeSTDX

FrequencyBodyGyroscopeSTDY

FrequencyBodyGyroscopeSTDZ

FrequencyBodyGyroscopeMeanFreqX

FrequencyBodyGyroscopeMeanFreqY

FrequencyBodyGyroscopeMeanFreqZ

FrequencyBodyAccelerometerMagnitudeMean

FrequencyBodyAccelerometerMagnitudeSTD

FrequencyBodyAccelerometerMagnitudeMeanFreq

FrequencyBodyAccelerometerJerkMagnitudeMean

FrequencyBodyAccelerometerJerkMagnitudeSTD

FrequencyBodyAccelerometerJerkMagnitudeMeanFreq

FrequencyBodyGyroscopeMagnitudeMean

FrequencyBodyGyroscopeMagnitudeSTD

FrequencyBodyGyroscopeMagnitudeMeanFreq

FrequencyBodyGyroscopeJerkMagnitudeMean

FrequencyBodyGyroscopeJerkMagnitudeSTD

FrequencyBodyGyroscopeJerkMagnitudeMeanFreq

AngletBodyAccelerometerMeanGravity

AngletBodyAccelerometerJerkMeanGravityMean

AngletBodyGyroscopeMeanGravityMean

AngletBodyGyroscopeJerkMeanGravityMean

AngleXGravityMean

AngleYGravityMean

AngleZGravityMean