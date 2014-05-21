GettingCleaningDataProject
==========================
## Synopsis

Este proyecto contiene scripts para procesar y obtener un set de datos limpio que sera usado en posteriores analisis.
El set de datos original contiene informacion obtenida de sensores de los Smartphones de 30 personas.
Para saber mas acerca del set de datos original dirigirse al siguiente link: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Modulos

El proyecto contiene dos R scrips:
* run_analysis.R-> Scrip pricipal, realiza la secuencias de pasos necesarios para obtener el data set limpio.
* fucntions.R->Scrip que contiene funciones utilizadas por run_analysis.R 

## Procesamiento

### 1-Load Files


```{r}
trainSetFile<-"../train/X_train.txt"
trainSet<-read.table(trainSetFile,colClasses="numeric")
```
### 2-Merges the training and the test sets to create one data set.


### 3-Extracts only the measurements on the mean and standard deviation for each measurement. 


### 4-Uses descriptive activity names to name the activities in the data set

### 5-Appropriately labels the data set with descriptive activity names. 

### 6-Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Installation

Provide code examples and explanations of how to get the project.

## API Reference

Depending on the size of the project, if it is small and simple enough the reference docs can be added to the README. For medium size to larger projects it is important to at least provide a link to where the API reference docs live.

## Tests

Describe and show how to run the tests with code examples.

## Contributors

Let people know how they can dive into the project, include important links to things like issue trackers, irc, twitter accounts if applicable.

## License

A short snippet describing the license (MIT, Apache, etc.)