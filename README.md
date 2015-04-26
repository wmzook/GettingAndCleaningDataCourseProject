# Getting-and-Cleaning-Data-Course-Project

## Instruction List

See the file run_analysis.R for the code.

### Download Data

The project uses the Human Activity Recognition Using Smartphones Data
Set from UCI Machine Learning Repository.  We download the zip file if
it does not already exist and extract the data files if they do not
already exist.

### Extract and Combine Desired Columns from Training and Test Data

We use grep to determine which feature names (columns of the data set)
correspond to means or standard deviations of variables (these columns
correspond to variable names in the features.txt file containing
either "mean()" or "std()").  Armed with this information, we use the
colClasses argument to the read.table() function, setting the value of
colClasses to "NULL" for those columns that we will not be using (and
to "numeric" for those columns that we will retain).

We use cbind to combine these columns with the columns of subject
codes and activity codes for both the training and test data, and we
use rbind to combine the resulting training and test data into a
single data frame.  We have not bothered to tag the resulting rows as
either "training" or "test", because this was not required for our
purposes.  However, it would be easy to modify this script to add this
information to the data frame if desired.

### Use Descriptive Activity Names

This was a simple matter of replacing the codes for the activities
with labels extracted from the activity_labels.txt file and
shortened/simplified to be easier to work with.

### Appropriately Label the Data Set with Descriptive Variable Names

The variable names were taken from the features.txt file and
simplified by removing hyphens and parentheses and so forth.

### Compute the Average of Each Variable for Each Activity and Each Subject and Save

This is easily done using the aggregate() and write.table() functions.
The rows were also sorted by activity within subject for convenience.

## Code Book

The first variable is a code for the subject (1-30) performing the
activity, and the second describes the activity.  The remaining
columns are means and standard deviations of various measurements
taken during the performance of the activity.  Note that all of these
features have been normalized to lie between -1 and 1, which explains
the occurence of negative values among the standard deviations.

The first letter of the feature name indicates whether it is a
(normalized) (M)ean or a (normalized) standard (D)eviation.  The
second letter indicates with the measurement is a (t)ime domain
measurement or a (f)requency domain measurement (taken from on the
Fourier transform).  "X", "Y", an "Z" at the end of the measurement
name indicates which directional component of movement or velocity or
acceleration is represented by the measurement.

I do not know if the descriptions below accurately describe the
physical nature of the transformed measurements.  They are best
guesses based on the documentation provided by the data source.

- subject:                    code (1-30) for the subject performing the activity
- activity:                   activity label
- tBodyAccXMean:              mean body acceleration x-axis
- tBodyAccYMean:              mean body acceleration y-axis
- tBodyAccZMean:              mean body acceleration z-axis
- tBodyAccXStdDev:            standard deviation of body acceleration x-axis
- tBodyAccYStdDev:            standard deviation of body acceleration y-axis
- tBodyAccZStdDev:            standard deviation of body acceleration z-axis
- tGravityAccXMean:           mean gravity acceration signal x-axis
- tGravityAccYMean:           mean gravity acceration signal y-axis
- tGravityAccZMean:           mean gravity acceration signal z-axis
- tGravityAccXStdDev:         standard deviation of gravity acceration signal x-axis
- tGravityAccYStdDev:         standard deviation of gravity acceration signal y-axis
- tGravityAccZStdDev:         standard deviation of gravity acceration signal z-axis
- tBodyAccJerkXMean:          mean body acceleration jerk x-axis
- tBodyAccJerkYMean:          mean body acceleration jerk y-axis
- tBodyAccJerkZMean:          mean body acceleration jerk z-axis
- tBodyAccJerkXStdDev:        standard deviation of body acceration jerk x-axis
- tBodyAccJerkYStdDev:        standard deviation of body acceration jerk y-axis
- tBodyAccJerkZStdDev:        standard deviation of body acceration jerk z-axis
- tBodyGyroXMean:             mean body velocity x-axis
- tBodyGyroYMean:             mean body velocity y-axis
- tBodyGyroZMean:             mean body velocity z-axis
- tBodyGyroXStdDev:           standard deviation of body velocity x-axis
- tBodyGyroYStdDev:           standard deviation of body velocity y-axis
- tBodyGyroZStdDev:           standard deviation of body velocity z-axis
- tBodyGyroJerkXMean:         mean gyroscope jerk signal in X direction
- tBodyGyroJerkYMean:         mean gyroscope jerk signal in Y direction
- tBodyGyroJerkZMean:         mean gyroscope jerk signal in Z direction
- tBodyGyroJerkXStdDev:       standard deviation of gyroscope jerk signal in X direction
- tBodyGyroJerkYStdDev:       standard deviation of gyroscope jerk signal in Y direction
- tBodyGyroJerkZStdDev:       standard deviation of gyroscope jerk signal in Z direction
- tBodyAccMagMean:            mean magnitude of body acceleration
- tBodyAccMagStdDev:          standard deviation of magnitude of body acceleration
- tGravityAccMagMean:         mean magnitude of gravity acceleration
- tGravityAccMagStdDev:       standard deviation of magnitude of gravity acceleration
- tBodyAccJerkMagMean:        mean magnitude of body acceleration jerk
- tBodyAccJerkMagStdDev:      standard deviation of magnitude of body acceleration jerk
- tBodyGyroMagMean:           mean body velocity magnitude
- tBodyGyroMagStdDev:         standard deviation of body velocity magnitude
- tBodyGyroJerkMagMean:       mean gyroscope jerk signal magnitude
- tBodyGyroJerkMagStdDev:     standard deviation of gyroscope jerk signal magnitude
- fBodyAccXMean:              mean frequency of body acceleration x-axis
- fBodyAccYMean:              mean frequency of body acceleration y-axis
- fBodyAccZMean:              mean frequency of body acceleration z-axis
- fBodyAccXStdDev:            standard deviation of frequency of body acceleration x-axis
- fBodyAccYStdDev:            standard deviation of frequency of body acceleration y-axis
- fBodyAccZStdDev:            standard deviation of frequency of body acceleration z-axis
- fBodyAccJerkXMean:          mean frequency of body acceleration jerk x-axis               
- fBodyAccJerkYMean:          mean frequency of body acceleration jerk y-axis               
- fBodyAccJerkZMean:          mean frequency of body acceleration jerk z-axis               
- fBodyAccJerkXStdDev:        standard deviation of frequency of body acceration jerk x-axis
- fBodyAccJerkYStdDev:        standard deviation of frequency of body acceration jerk y-axis
- fBodyAccJerkZStdDev:        standard deviation of frequency of body acceration jerk z-axis
- fBodyGyroXMean:             mean frequency of body velocity x-axis                 
- fBodyGyroYMean:             mean frequency of body velocity y-axis                 
- fBodyGyroZMean:             mean frequency of body velocity z-axis                 
- fBodyGyroXStdDev:           standard deviation of frequency of body velocity x-axis
- fBodyGyroYStdDev:           standard deviation of frequency of body velocity y-axis
- fBodyGyroZStdDev:           standard deviation of frequency of body velocity z-axis
- fBodyAccMagMean:            mean frequency of magnitude of body acceleration                 
- fBodyAccMagStdDev:          standard deviation of frequency of magnitude of body acceleration
- fBodyBodyAccJerkMagMean:    mean frequency of magnitude of body acceleration jerk                 
- fBodyBodyAccJerkMagStdDev:  standard deviation of frequency of magnitude of body acceleration jerk
- fBodyBodyGyroMagMean:       mean frequency of body velocity magnitude                 
- fBodyBodyGyroMagStdDev:     standard deviation of frequency of body velocity magnitude
- fBodyBodyGyroJerkMagMean:   mean frequency of gyroscope jerk signal magnitude                 
- fBodyBodyGyroJerkMagStdDev: standard deviation of frequency of gyroscope jerk signal magnitude

