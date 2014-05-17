#
#
editingLabel <- function(x){
    x<-gsub("\\(|\\)","",x)
    x<-gsub("angle","angle_",x)
    gsub("-|,","_",x)
    
}