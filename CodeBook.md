---
title: "CodeBook for Getting and Cleaning data project"
author: "KMM"
date: "Sunday, October 19, 2014"
output: html_document
---

Starting data:  The initial data for this project is located at the following URL:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The explanation for all the datasets included in the above zip file is at the URL below:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Data from the original train and test data sets were combined into one large data set.

One row is provided for each combination of the 30 subjects in the experiment and the 6 activities measured.  Each of the other variables besides Subjects and Activities contains the average value measured over the study for that subject and activity.

The ?? response variables are the variables that relate to the mean and standard deviation responses measured in the original study.

Levels of the "Subjects" variable:  
 -  Integers 1 through 30, each representing a different human test subject.

Levels of the "Activites"" variable   
1. WALKING  
2. WALKING_UPSTAIRS  
3. WALKING_DOWNSTAIRS  
4. SITTING  
5. STANDING  
6. LAYING  


Original data set description (from data repository referenced in the README.mdfeatures_info.txt file)

Only the average mean() and standard deviation std() values were kept from the list of calculated statistics below, and a mean of these were calcyulated for each subject and each activity.


###Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
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

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'







