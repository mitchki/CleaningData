## setup for Windows 7 OS
setInternet2(TRUE)

## Download and unzip zipped data
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile = "projectZIP.zip") 
dateZipDownloaded <- date()
unzip("projectZIP.zip")

library(data.table)

## read all the data into R
features <- read.table("UCI HAR Dataset/features.txt")
varNames <- features[,2]

activityLabels  <- read.table("UCI HAR Dataset/activity_labels.txt")
activityNames <- activityLabels[,2]

rawTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
activitiesTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectsTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
rawTest <- read.table("UCI HAR Dataset/test/X_test.txt")
activitiesTest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectsTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Set column names in main data sets
colnames(rawTrain) <- varNames
colnames(rawTest) <- varNames

## Use only the columns whose names contain "mean" or "std"
useCols <- xor( grepl("mean()",colnames(rawTrain)),  grepl("std()",colnames(rawTrain)))
useCols <- useCols & !grepl("meanFreq()",colnames(rawTrain))

## select only the columns indicating means or standard deviations
selTrain <- rawTrain[,useCols]
selTest <- rawTest[,useCols]

## add columns for subject and activity
selTrain <- cbind(subjectsTrain,selTrain)
selTest <- cbind(subjectsTest,selTest)
selTrain <- cbind(activitiesTrain,selTrain)
selTest <- cbind(activitiesTest,selTest)


## Combine test and train data by rows into one large data set
totalData <- rbind(selTest,selTrain)

## Name the first two columns that contain activities and subjects
colnames(totalData) <- c("Activities","Subjects",colnames(totalData)[3:68])

## Change data frame to a data table with Activities and Subjects as keys
totalData <- data.table(totalData)
setkey(totalData,Activities,Subjects)

## Change activities and subjects to factors
totalData$Activities <- factor(totalData$Activities,labels=activityNames)
setorder(totalData,Subjects)
totalData$Subjects <- factor(totalData$Subjects)

## Create tidy data set with means for each remaining variable 
## by Activity and Subject
tidy <- totalData[,lapply(.SD,mean),by=c("Activities","Subjects")]

## Clean up variable names
names(tidy)<- gsub("...X","Xaxis",names(tidy))
names(tidy)<- gsub("...Y","Yaxis",names(tidy))
names(tidy)<- gsub("...Z","Zaxis",names(tidy))
names(tidy)<- gsub("^t","time",names(tidy))
names(tidy)<- gsub("^f","frequency",names(tidy))

names(tidy)<- gsub("\\.","",names(tidy))
names(tidy)<- gsub("mean","Mean",names(tidy))
names(tidy)<- gsub("std","StdDev",names(tidy))

write.table(tidy,"tidyData.txt",row.name=FALSE)


