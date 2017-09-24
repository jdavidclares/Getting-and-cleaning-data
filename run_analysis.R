library(dplyr)
library(reshape2)

#Step 0 - Reading data (previously downloaded)

#Reading test set
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

#Reading train set
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

#Reading features and activities

features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
activities <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

#STEP 1 - Merge the train and test set to get one single data set

data <- rbind(cbind(subject_train, y_train, X_train), cbind(subject_test, y_test, X_test))
colnames(data) <- c("Subject", "Activity", features$V2)

#STEP 2 - Extract only the measurements on the mean and standard deviation

feat_chosen <- grepl("Subject|Activity|mean|std", colnames(data))
data<-data[,feat_chosen]

#STEP 3 - Use descriptive activity names to name the activities in the data set

data$Activity <- factor(data$Activity,levels=activities$V1,labels=activities$V2)

#STEP 4 - Appropiately labels the data set with descriptive variable names

colnames(data) <- gsub("mean[(]?[)]?-?","Mean", colnames(data))
colnames(data) <- gsub("std[(]?[)]?-?","StandDev", colnames(data))
colnames(data) <- gsub("[(][)]", "", colnames(data))

#Step 5 - Create independent tidy data with the average of each variable for each activity 
# and each subject

tidyData <- data
tidyData.melted <- melt(tidyData, id = c("Subject", "Activity"))
tidyData.mean <- dcast(tidyData.melted, Subject + Activity ~ variable, mean)

write.table(tidyData.mean,"tidy_data.txt",row.names = FALSE)

