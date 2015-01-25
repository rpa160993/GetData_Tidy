testactivity<-read.table("C:\\Users\\ACER\\Documents\\UCI HAR Dataset\\test\\y_test.txt")
testsubject<-read.table("C:\\Users\\ACER\\Documents\\UCI HAR Dataset\\test\\subject_test.txt")
test<-read.table("C:\\Users\\ACER\\Documents\\UCI HAR Dataset\\test\\X_test.txt")
test2<-cbind(testsubject,testactivity,test)
trainactivity<-read.table("C:\\Users\\ACER\\Documents\\UCI HAR Dataset\\train\\y_train.txt")
trainsubject<-read.table("C:\\Users\\ACER\\Documents\\UCI HAR Dataset\\train\\subject_train.txt")
train<-read.table("C:\\Users\\ACER\\Documents\\UCI HAR Dataset\\train\\X_train.txt")
train2<-cbind(trainsubject,trainactivity,train)
## Merges the training and the test sets to create one data set
fullset<-rbind(test2,train2)
features<-read.table("C:\\Users\\ACER\\Documents\\UCI HAR Dataset\\features.txt")
names(fullset)<-c("Subject","Activity",as.character(features[,2]))
names(fullset)<-make.unique(names(fullset))
## Extracts only the measurements on the mean and standard deviation for each measurement
fullset2<-select(fullset,Subject,Activity,contains("mean()"),contains("std()"))
## creates a second, independent tidy data set with the average of each variable for each activity and each subject
fullset3<-group_by(fullset2,Subject,Activity)
tidyset<-summarise_each(fullset3,funs(mean))
write.table(tidyset,"C:\\Users\\ACER\\Documents\\tidydata.txt",row.names=FALSE)
