--- 

Coursera Massive Open Online Course
 ' R - Getting and Cleaning Data '

Version 1.0-getdata-012

--- 

Author: Participant in den Course

--- 

### Overview

This file contains description of the file 'run_analysis.R' which
is a computer program to manipulate statstical data derived from
a experiment called 
  
  'Human Activity Recognition Using Smartphones Dataset'

### Description of the experiments

There have bean experiments, where people do six activites (WALKING, SITTING, STANDING,..) while 
wearing a smartphone recording this activities. See www.smartlab.ws for further details.

The resulting data set was used in a online course to create a so called 'tidy data set' from the files
given from the experiment, which in case were not so tidy in the manner the course would call that.

The files from the expirements were 
- combined, to create one 'independent tidy data set with the average of each variable for each activity
  and each subject'.
- to provide merely the averages of each variable; the raw data were suppressed in the new data set.

### Provided Features

- A 66-feature vector with averages of time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


### Data Set Content

- 'README.txt'

- 'output.txt' the data set

- 'run_analysis.R' which customizes the original UCR HCI Dataset

### Customization to original data set

The R language script 'run_analysis.R' does the following: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the 
   average of each variable for each activity and each subject.

### Notes 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a column on the text file.
- Each feature is the Arithmetic Mean of the original data sets corresponding value

For more information about this dataset contact: activityrecognition@smartlab.ws
and https://class.coursera.org/getdata-012/

### License

see original data set

### Feature Selection 

The original dataset contains raw signals for accelerometer and gyroscope signals denotated by 't') 
in addition with transformations to gain frequency information (denotaded by 'f').

In the Coursera course one has to compute the Arithmetic Mean (mean) for each of these values 
corresponding to the kind of activity and contributed subject. 

The originalsignals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ 
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation

To be concrete, eg. as 'tBodyAcc-XYZ' is a shorthand for three signals:
- tBodyAcc-X
- tBodyAcc-Y
- tBodyAcc-Z

and there are two different variables estimated from each of them (mean and std)
this single name stands for six observations in the data set:

- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z
- tBodyAcc-std()-Z
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z

In addition the two grouping elements:

- activity
- subject
