
# Helped a lot: Nunno Nugroho (RPubs)

# I didn't mean to copy the answer and i checked the guide after finishing my own assignment
# because it was really weird, using 3 or 4 functions to do something simple... And I was
# correct, most answers to the assignment were resolved by 1 well designed function.  

# And... The naming convention of the variables are common sense that happened way before
# i checked his answer, i am a little more reassured now that my naming choices are fine.
# (After all, english is not my native language and I'm not fluent yet)

library (dplyr)


# This one i got from a tutorial because i really think this is cool (after 
# seeing the optimized way to solve some things that i made with 3 functions.

filename <- "finalProject.zip"

# Checking if archive already exists.
if (!file.exists(filename)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

### 1 - Merges the training and the test sets to create one data set.

# get columns names from "root" folder

setwd ("~/UCI HAR Dataset")

features <- read.table ("features.txt", col.names = c ("n", "names"))

activity_labels <- read.table ("activity_labels.txt", col.names = c ("n", "activity"))

# get data from test folder

setwd ("test")

subject_test <- read.table ("subject_test.txt", col.names = c ("subject"))

x_test <- read.table ("X_test.txt", col.names = features$names)

y_test <- read.table ("y_test.txt", col.names = c ("activity"))

test_data <- cbind (subject_test, y_test, x_test)

rm (subject_test, y_test, x_test)

# get data from train folder

setwd ("../train")

subject_train <- read.table ("subject_train.txt", col.names = c ("subject"))

x_train <- read.table ("X_train.txt", col.names = features$names)

y_train <- read.table ("y_train.txt", col.names = c ("activity"))

train_data <- cbind (subject_train, y_train, x_train)

rm (subject_train, y_train, x_train)

# merge both datasets

merged_data <- rbind (test_data, train_data)

rm (test_data, train_data)

### 2 - Extracts only the measurements on the mean and standard deviation 
###     for each measurement.

tidy_data <- merged_data %>% select (subject, activity, contains ("mean"), 
                                     contains ("std"))

### 3 - Uses descriptive activity names to name the activities in the data set

tidy_data$activity <- activity_labels [tidy_data$activity, 2]

### 4 - Appropriately labels the data set with descriptive variable names. 

names (tidy_data) <- gsub ("Acc", "Accelerometer ", names (tidy_data))

names (tidy_data) <- gsub ("Gyro", "Gyroscope ", names (tidy_data))

# use of regex | " ^ " => starting position of string

names (tidy_data) <- gsub ("^t", "Time ", names (tidy_data))

names (tidy_data) <- gsub ("^f", "Frequency ", names (tidy_data))

names (tidy_data) <- gsub ("Mag", "Magnitude ", names (tidy_data))


### 5 - From the data set in step 4, creates a second, independent tidy data set 
###     with the average of each variable for each activity and each subject.

tidy_data2 <- tidy_data %>% group_by (subject, activity) %>% 
                            summarise_all (list (mean = mean))
