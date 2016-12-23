# Code Book for executing run_analysis.R

## Step 1 - Preparation

* Download source data from the location specified (the script has this download and unzip file included
* Run the R script in R studio


## Step 2 - Source data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Step 3 - Description of the script
### 1) Create one data set by merging the training and test data sets
#### a) Reading all files one by one
* reading the trainings tables
* reading the testing tables
* reading the activity labels
* reading the feature vector

#### b) Then assign appropriate column names
* Finally, merge all previous created data into one data set

### 2) Extracting only the measurements on the mean and standard deviation for each measurement
#### a) Read column names into a new variable
* Create a vector for defining ID, mean and standard deviation
* Create the subset for the mean and standard deviation only from the merged dataset

### 3) Using descriptive activity names to name the activities in the data set

### 4) Appropriately labeling the data set with descriptive variable names

### 5) From the data set in the previous step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Create a second tidy data set
* Write the second tidy data set in the required txt file
