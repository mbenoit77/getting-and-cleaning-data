## Load the reshape2 library
library(reshape2)

## Download the dataset, if necessary
	
if (!file.exists("dataset.zip")) {
	fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(fileUrl, destfile = "./dataset.zip")
}

## Unzip the dataset, if necessary
if (!file.exists("dataset")) {
	unzip("./dataset.zip")
	file.rename("UCI HAR Dataset", "dataset")
}

## pull the headers into a dataframe
headers = read.table("./dataset/features.txt")

## read in the test data
testDF = read.table("./dataset/test/X_test.txt")

## read in the training data
trainDF = read.table("./dataset/train/X_train.txt")

## Requirement 1: Merges the training and the test sets to create one data set
fullDF = rbind(testDF, trainDF)

head(fullDF)
summary(fullDF)


## Requirement 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
meanStdDF <- fullDF[, grep("(mean\\(|std\\()", headers$V2, fixed=FALSE)]

## read in the activity data and merge to one dataset
testActivityDF = read.table("./dataset/test/y_test.txt", col.names = "ActivityID")
trainActivityDF = read.table("./dataset/train/y_train.txt", col.names = "ActivityID")
fullActivityDF = rbind(testActivityDF, trainActivityDF)

## read the activity labels
activtiesDF = read.table("./dataset/activity_labels.txt")

## Requirement 3: Uses descriptive activity names to name the activities in the data set.
meanStdDF$Activity <- factor(fullActivityDF$ActivityID, levels=activtiesDF$V1, labels=activtiesDF$V2)

## Requirement 4: Appropriately labels the data set with descriptive variable names.
headerVector <- headers[grep("(mean\\(|std\\()", headers$V2, fixed=FALSE), 2]
headerVector <- c(as.character(headerVector), "Activity")
colnames(meanStdDF) <- headerVector


## read in the subject data and merge to one dataset
testSubjectDF = read.table("./dataset/test/subject_test.txt", col.names = "SubjectID")
trainSubjectDF = read.table("./dataset/train/subject_train.txt", col.names = "SubjectID")
fullSubjectDF = rbind(testSubjectDF, trainSubjectDF)

## Append the SubjectID to the pared down dataframe
meanStdDF <- cbind(meanStdDF, fullSubjectDF)

head(meanStdDF)
summary(meanStdDF)

## Requirement 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
meltedDF <- melt(meanStdDF, id=c("Activity", "SubjectID"))
tidyDataSetDF <- dcast(meltedDF, SubjectID + Activity ~ variable, mean)

head(tidyDataSetDF)
summary(tidyDataSetDF)

write.table(tidyDataSetDF, file="./tidyDataSet.txt", row.names=FALSE)

