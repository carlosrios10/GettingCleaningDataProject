#
#
editingLabel <- function(x){
    x<-gsub("\\(|\\)","",x)
    x<-gsub("angle","angle_",x)
    gsub("-|,","_",x)
    
}
#
#
func<-function(x) {
        la<-lapply(x[1:66],mean)
        data.frame(la)
}
#
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