##
## Coursera - R Programming course 3: Getting and Cleaning Data
##
## Project Assignment
##
## You should create one R script called run_analysis.R that does the following. 
##

# My Obervations
# - there is a file name 'features.txt' which describes 
# 561 features
# The test and train files all hold the same number of lines
# - test:  2947
# - train: 7352
# the so called dataset files X_test.txt and X_train.txt
# hold 561 variables in each line, that should be the features
# btw these are (2947+7352)*561
# [1] 5.777.739 values

### 1. Merges the training and the test sets to create one data set.

read.UCI <- function(testOrTrain, file) {
  read.table(paste('UCI HAR DATASET/', testOrTrain , '/', file, sep =""))
}

# load the datasets
x_train = read.UCI('train', 'X_train.txt')
x_test = read.UCI('test', 'X_test.txt')
x_both = rbind(x_test, x_train)

### 2. Extracts only the measurements on the mean and standard deviation for each
###measurement.

# a) first append all the feature names to the data set
#    load the features file with the names
features_all = read.UCI('', 'features.txt') 
names(x_both) = features_all$V2

# b) now filter for mean and std
#features_mean = features_all$V2[grep('mean\\(', features_all$V2)]
#features_std = features_all$V2[grep('std\\(', features_all$V2)]
#x_thin = subset(x_both, TRUE, select = c(features_mean, features_std))
means = grep('mean\\(', features_all$V2)
stds = grep('std\\(', features_all$V2)
x_thin = subset(x_both, TRUE, select = c(means,stds))


### 3. Uses descriptive activity names to name the activities in the data set

# a) first read the values and combine them to one
activity_train = read.UCI('train', 'y_train.txt')
activity_test = read.UCI('test', 'y_test.txt')
activity_both = rbind(activity_test, activity_train)

# b) second create a vector with the names
labels = read.UCI('', 'activity_labels.txt')
labelfactor = factor(labels$V2)
activities = labelfactor[activity_both$V1]

# b) append it to the dataset
# no, aggregate will do ... 
#x_all = cbind(activity = activities, x_thin)
x_all = x_thin

### 4. Appropriately labels the data set with descriptive variable names. 
#done in Step 1
subject_train = read.UCI('train', 'subject_train.txt')
subject_test = read.UCI('test', 'subject_test.txt')
subject_both = rbind(subject_test, subject_train)

# add it to the dataset (producing a new one)
# no, aggregate will do..
#x_all = cbind(subject = subject_both$V1, x_all)

### 5. From the data set in step 4, creates a second, independent tidy data set
#with the average of each variable for each activity and each subject.

#aggregate(cbind(subject,activity) ~ a+b, df, mean)
x_new = aggregate(x_all, by=list(subject=subject_both$V1, activity=activity_both$V1), mean)

write.table(x_new, 'output.txt', row.names=F)

#
#
#EOF