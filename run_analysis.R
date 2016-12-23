library(plyr)

# Preparation - Download dataset from the website
if(!file.exists("./sourcedata")){dir.create("./sourcedata")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./sourcedata/Dataset.zip")

# Unzip the dataSet to /sourcedata directory
unzip(zipfile="./sourcedata/Dataset.zip",exdir="./sourcedata")


# 1) Create one data set by merging the training and test data sets

# a) Read all files one by one

# reading trainings tables:
x_train <- read.table("./sourcedata/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./sourcedata/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./sourcedata/UCI HAR Dataset/train/subject_train.txt")

# reading testing tables:
x_test <- read.table("./sourcedata/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./sourcedata/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./sourcedata/UCI HAR Dataset/test/subject_test.txt")

# reading activity labels:
activity_labels = read.table('./sourcedata/UCI HAR Dataset/activity_labels.txt')

# reading feature vector:
features <- read.table('./sourcedata/UCI HAR Dataset/features.txt')

# b) Assign column names:
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activity_labels) <- c('activityId','activityType')

# c) Finally, merge all previous created data into one data set
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
merged_data_set <- rbind(merge_train, merge_test)

# 2. Extracting only the measurements on the mean and standard deviation for each measurement

# a) Read column names into a new variable
colNames <- colnames(merged_data_set)

# b) Create a vector for defining ID, mean and standard deviation
v_meanStd <- (grepl("activityId" , colNames) | 
                         grepl("subjectId" , colNames) | 
                         grepl("mean.." , colNames) | 
                         grepl("std.." , colNames) 
)

# c) Create the subset for the mean and standard deviation only from the merged dataset
meanStd_data_set <- merged_data_set[ , v_meanStd == TRUE]

# 3. Using descriptive activity names to name the activities in the data set
ActivityNames_data_set <- merge(meanStd_data_set, activity_labels, by='activityId', all.x=TRUE)

# Appropriately labeling the data set with descriptive variable names.
# Already done this step in 1b) and 2a), 2b)

# 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject:

# a) Create a second tidy data set
TidyDataSet <- aggregate(. ~subjectId + activityId, ActivityNames_data_set, mean)
TidyDataSet <- TidyDataSet[order(TidyDataSet$subjectId, TidyDataSet$activityId),]

# b) Write the second tidy data set in the required txt file
write.table(TidyDataSet, "TidyDataSet.txt", row.name=FALSE)