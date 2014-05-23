GettingCleaningDataProject
==========================
## Synopsis
This project contains two R scripts to process and get a tidy data set that will be used in subsequent analysis.

Original data set contains information from sensors of smartphones.To know about this data set a full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 
## Tidy Data Set Format
The final data set that we want get will have this format.

This final data set will have average of each variable for each activity and each subject. 

Example:

| activity   | subject | tBodyAccMeanX  |VarN   |...|
| -----------|-------- | ---------------|-------|---|
| LAYING     | 1       | 0.2215982      |mean   |...|
| LAYING     | 2       | mean           |mean   |...|
| ...        |...      |...             |...    |...|


## Modules

The project contains two R scripts:
* run_analysis.R : Main script performs the sequence of steps required to get the tidy data set.
* functions.R : Script that contains functions used by run_analysis.R. 

## Process
In this seccion I will describe the sequence of steps perform by run_analysis.R script.

### 1-Load Files
In this step all the files used in processing load.

Code example:
```{r}
trainSetFile<-"../train/X_train.txt"
trainSet<-read.table(trainSetFile,colClasses="numeric")
```
### 2-Merges the training and the test sets to create one data set.
In this step I merge the training and the test set with function **rbind**, to get one data set with 10299 instances and 561 variables.

Code Example:
```{r}
mergeDataSet<-rbind(trainSet,testSet)
```

### 3-Extracts only the measurements on the mean and standard deviation for each measurement. 
In this step I perfom these steps

1. Search the variables representing the mean and standard deviation using the function **grepl** in fetaures.txt file.
2. From the data set created in step 2 to get the columns that represent these variables.

Code Example:
```{r}
mergeDataSetMeanStd<-cbind(mergeDataSet[,grepl("mean()",features[[2]],fixed=T)],
                           mergeDataSet[,grepl("std()",features[[2]],fixed=T)])
```


### 4-Uses descriptive activity names to name the activities in the data set
In this step I add the activity column and the subject column, each activity is assigned a descriptive name using the function **getDescriptiveActivity** .

Code Example:
```{r}
activitis<-rbind(trainLabels,testLabels)
activitis<-getDescriptiveActivity(activitis)
subject<-rbind(trainSubject,testSubject)
mergeDataSetMeanStd<-cbind(mergeDataSetMeanStd,activitis)
mergeDataSetMeanStd<-cbind(mergeDataSetMeanStd,subject)
```
### 5-Appropriately labels the data set with descriptive activity names.
In this step I label the data set with descriptive column names, I used CamelCase Format (http://en.wikipedia.org/wiki/CamelCase).

Function **editingLabel** performs the conversion.

Code Example:
```{r}
featuresMeanStd<-rbind(features[grepl("mean()",features[[2]],fixed=T),],
                       features[grepl("std()",features[[2]],fixed=T),])
featuresMeanStd<-sapply(as.list(featuresMeanStd[[2]]),editingLabel)
names(mergeDataSetMeanStd)<-c(featuresMeanStd,"activity","subject")
```
### 6-Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
In this step I build the tidy data set with **ddply** function, this function is in **plyr** package.

Code Example:
```{r}
finalTidyDataSet<-ddply(mergeDataSetMeanStd,.(activity,subject),averageEachMeasure)
```
## Installation
To run this project and get the tidy data set you must perform these steps below. 

1. Download project.
2. Download [original data set][id] and unpack it into your working directory.(without change folder name)
3. Execute the file run_analysis.R.


[id]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
