setwd("D:/coursera-gettingandcleaningdata/GettingCleaningDataProject")
getwd()
rm(list=ls())
library("plyr")
source("functions.R")

#load files
trainSetFile<-"UCI HAR Dataset/train/X_train.txt"
trainLabelsFile<-"UCI HAR Dataset/train/y_train.txt"
trainSubjectFile<-"UCI HAR Dataset/train/subject_train.txt"
testSetFile<-"UCI HAR Dataset/test/X_test.txt"
testLabelsFile<-"UCI HAR Dataset/test/y_test.txt"
testSubjectFile<-"UCI HAR Dataset/test/subject_test.txt"
featuresFile<-"UCI HAR Dataset/features.txt"

features<-read.table(featuresFile,colClasses="character")
trainSet<-read.table(trainSetFile,colClasses="numeric")
trainLabels<-read.table(trainLabelsFile,colClasses="numeric")
trainSubject<-read.table(trainSubjectFile,colClasses="numeric")
testSet<-read.table(testSetFile,colClasses="numeric")
testLabels<-read.table(testLabelsFile,colClasses="numeric")
testSubject<-read.table(testSubjectFile,colClasses="numeric")

#1-Merges the training and the test sets to create one data set.
mergeDataSet<-rbind(trainSet,testSet)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
mergeDataSetMeanStd<-cbind(mergeDataSet[,grepl("mean()",features[[2]],fixed=T)],mergeDataSet[,grepl("std()",features[[2]],fixed=T)])

#Uses descriptive activity names to name the activities in the data set
activitis<-rbind(trainLabels,testLabels)
activitis<-getDescriptiveActivity(activitis)
subject<-rbind(trainSubject,testSubject)
mergeDataSetMeanStd<-cbind(mergeDataSetMeanStd,activitis)
mergeDataSetMeanStd<-cbind(mergeDataSetMeanStd,subject)

#Appropriately labels the data set with descriptive activity names. 
featuresMeanStd<-rbind(features[grepl("mean()",features[[2]],fixed=T),],features[grepl("std()",features[[2]],fixed=T),])
featuresMeanStd<-sapply(as.list(featuresMeanStd[[2]]),editingLabel)
names(mergeDataSetMeanStd)<-c(featuresMeanStd,"activity","subject")

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# write.csv(mergeDataSetMeanStd,"mergeDataSetMeanStd.csv",row.names =FALSE)
# mergeDataSetMeanStd<-read.csv("mergeDataSetMeanStd.csv")
finalTidyDataSet<-ddply(mergeDataSetMeanStd,.(activity,subject),func)
write.table(finalTidyDataSet, "finalTidyDataSet.txt", sep="\t",row.names =FALSE)
tidy<-read.table("finalTidyDataSet.txt",header=T)
View(tidy)
