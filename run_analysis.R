getting_data<-function() {
  features<-read.table("features.txt",as.is=T)
  colnames(features)<-c("obs","name")
  names<-features[,2]
  y_train<-read.table("train//y_train.txt",as.is = T)
  x_train<-read.table("train//x_train.txt",as.is = T)
  subject_train<-read.table("train//subject_train.txt")
  x_train$activity_number<-y_train[,1]
  x_train$subject<-subject_train[,1]
  y_test<-read.table("test//y_test.txt",as.is = T)
  x_test<-read.table("test//x_test.txt",as.is = T)
  subject_test<-read.table("test//subject_test.txt")
  x_test$activity_number<-y_test[,1]
  x_test$subject<-subject_test[,1]
  x_merge<-rbind(x_train,x_test)
  print(table(x_merge$subject,x_merge$activity))
  colnames(x_merge)[1:561]<-names
  mean_columns<-grep("mean",names)
  stdev_columns<-grep("std",names)
  columns<-c(mean_columns,stdev_columns)
  columns<-sort(columns)
  columns<-c(563,562,columns)
  x_merge<-x_merge[,columns]
  activity_labels<-read.table("activity_labels.txt")
  colnames(activity_labels)<-c("activity_number","activity_name")
  x_final<-merge(x_merge,activity_labels,by="activity_number",all=T)
  x_final
}

averaging_data<-function(data) {
  stats<-NULL
  stats2<-colnames(data)[3:81]
  activity<-sort(unique(data$activity_name))
  for(subject in sort(unique(data$subject))) {
    for(activity_name in activity){
      data2<-data[data$subject==subject&data$activity_name==activity_name,]
      column_mean<-colMeans(data2[3:81])
      x<-as.data.frame(t(column_mean))
      x$subject<-subject
      x$activity_name<-activity_name
      stats<-rbind(stats,x)
    }
  }
  names<-colnames(stats)
  names<-gsub("\\(\\)","",names)
  colnames(stats)<-names
  number_columns<-dim(stats)[2]
  ordered_columns<-c(number_columns-1,number_columns,1:(number_columns-2))
  stats<-stats[,ordered_columns]
  stats
}

data<-getting_data()
average_tidy_data<-averaging_data(data)
#write.table(average_tidy_data,"average_tidy_data.txt",row.names=FALSE)