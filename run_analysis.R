library(plyr)
#import test and training data sets
#Column names
varNames<-read.table("features.txt", stringsAsFactors = FALSE)
#import test data set
testData<-read.table("./test/X_test.txt", col.names = varNames[,2])
#import training data set
trainData<-read.table("./train/X_train.txt", col.names = varNames[,2])

#STEP 1: merge data sets: both have 561 variables with the same order.
#For merging I use rbind
mergeData<-rbind(testData, trainData)

#STEP2: take only mean and std variables
#select variable names with words mean o std
varNames_mean_std<-varNames[grep("(mean|std)\\(", varNames[,2]),]
#select data from merged data that match with mean and std variables
std_mean_Data<-mergeData[,varNames_mean_std[,1]]

#STEP 3: use descriptive activity names to name de activities in data set.
actTest<-read.table("./test/y_test.txt", stringsAsFactors = FALSE, col.names = "Activity")
actTrain<-read.table("./train/y_train.txt", stringsAsFactors = FALSE, col.names = "Activity")
actData<-rbind(actTest, actTrain)
#add the activity row to mail data set
mergeData<-cbind(mergeData, actData)
#read activity names
actNames<-read.table("activity_labels.txt", stringsAsFactors = FALSE)
#replace data with activity names
mergeData$Activity<-actNames[mergeData$Activity, 2]


#STEP 4: use descriptive name for variable names
#Using t=time, f=frecuency, Acc=Accelerometer, Gyro=Gyroscope, Mag=Magnitude
#BodyBody=Body
names(mergeData)<-gsub("^t", "time", names(mergeData))
names(mergeData)<-gsub("^f", "frequency", names(mergeData))
names(mergeData)<-gsub("Acc", "Accelerometer", names(mergeData))
names(mergeData)<-gsub("Gyro", "Gyroscope", names(mergeData))
names(mergeData)<-gsub("Mag", "Magnitude", names(mergeData))
names(mergeData)<-gsub("BodyBody", "Body", names(mergeData))

#STEP 5: create a new data set with the average of each variable 
#for each activity and each subject.
#read subject data and bind with data set
subjectTest<-read.table("./test/subject_test.txt", col.names = "Subject")
subjectTrain<-read.table("./train/subject_train.txt", col.names = "Subject")
subject<-rbind(subjectTest, subjectTrain)
#bind subject data to merge data
mergeData<-cbind(mergeData, subject)
#create a new data frame with the average
finalData<-aggregate(. ~Subject + Activity, mergeData, mean)
write.table(finalData, file="tidyDataSet.txt", row.name=FALSE)