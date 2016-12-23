# Code Book for executing run_analysis.R

## Step 1 - Preparation

* Download source data from the location specified (the script has this download and unzip file included
* Run the R script in R studio


## Step 2 - Source data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Step 3 - Description of the script
### Create one data set by merging the training and test data sets
1. Reading all files one by one
* reading the trainings tables
* reading the testing tables
* reading the activity labels
* reading the feature vector
2. Then assign appropriate column names
* Finally, merge all previous created data into one data set
### Extracting only the measurements on the mean and standard deviation for each measurement
1. Read column names into a new variable
* Create a vector for defining ID, mean and standard deviation
* Create the subset for the mean and standard deviation only from the merged dataset
### Using descriptive activity names to name the activities in the data set
### Appropriately labeling the data set with descriptive variable names
### From the data set in the previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
1. Create a second tidy data set
2. Write the second tidy data set in the required txt file