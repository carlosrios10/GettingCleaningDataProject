#1-Merges the training and the test sets to create one data set.
setwd("C:/Users/Usuarioç/Desktop/carlos/Getting Cleaning Data/GettingCleaningDataProject")
getwd()

source("functions.R")
trainSetFile<-"UCI HAR Dataset/train/X_train.txt"
trainLabelsFile<-"UCI HAR Dataset/train/y_train.txt"
trainSubjectFile<-"UCI HAR Dataset/train/subject_train.txt"

trainSet<-read.table(trainSetFile,colClasses="numeric")
trainLabels<-read.table(trainLabelsFile,colClasses="numeric")
trainSubject<-read.table(trainSubjectFile,colClasses="numeric")

testSetFile<-"UCI HAR Dataset/test/X_test.txt"
testLabelsFile<-"UCI HAR Dataset/test/y_test.txt"
testSubjectFile<-"UCI HAR Dataset/test/subject_test.txt"


testSet<-read.table(testSetFile,colClasses="numeric")
testLabels<-read.table(testLabelsFile,colClasses="numeric")
testSubject<-read.table(testSubjectFile,colClasses="numeric")

mergeDataSet<-rbind(train,test)
featuresFile<-"UCI HAR Dataset/features.txt"
features<-read.table(featuresFile,colClasses="character")
features<-sapply(as.list(features[[2]]),editingLabel)
names(mergeDataSet)<-features
dd<-cbind(mergeDataSet[,grepl("mean()",features[[2]],fixed=T)],mergeDataSet[,grepl("std()",features[[2]],fixed=T)])
activities =rbind(trainLabels,testLabels)
subjects = rbind(trainSubject,testSubject)
dd<-cbind(dd,activities=activities[[1]],subjects=subjects[[1]])



