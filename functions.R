#
#This function change data set's labels to its camel case format. 
#
editingLabel<- function(x){
    x<-gsub("\\(|\\)","",x)
    s <- strsplit(x, "-")[[1]]
    s<-paste(toupper(substring(s, 1, 1)), substring(s, 2),sep = "", collapse = "")
    paste(tolower(substring(s, 1, 1)), substring(s, 2),sep = "", collapse = "")
    
}
#
#This create a data frame whit average for each measure 
#
averageEachMeasure<-function(x) {
        la<-lapply(x[1:66],mean)
        data.frame(la)
}
#
# This function change an activity number to its description.
#
getDescriptiveActivity <- function (activitis) {
        activitis[which(activitis=="1"),]<-"WALKING"
        activitis[which(activitis=="2"),]<-"WALKING_UPSTAIRS"
        activitis[which(activitis=="3"),]<-"WALKING_DOWNSTAIRS"
        activitis[which(activitis=="4"),]<-"SITTING"
        activitis[which(activitis=="5"),]<-"STANDING"
        activitis[which(activitis=="6"),]<-"LAYING"
        return(activitis)
}