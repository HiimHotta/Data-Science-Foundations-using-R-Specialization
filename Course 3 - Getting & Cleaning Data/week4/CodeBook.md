

Some initial consideration:

1. Most of `rm ()` functions are used to free some memory and keep my workspace 
clean (personal choices)

2. There are a lot of comments in the code that explains most of the steps and
decision taken.

#Code:

1. Import library `dplyr`

2. Download the zip file containing the data and unzip.

### 1 - Merges the training and the test sets to create one data set.

3. Get data from the files on UCI folder

- `features` -> from `features.txt`, contains the name of the columns and the feature
that they represent

- `activity_label` -> from `activity_labels.txt`, contains a key-value 
(number-string)

4. change directory to get test/train files (analogous, just have different names)

- `subject_test/train` -> the subject that represents a row (from 1 to 30)

- `x_test/train` -> each column is a feature (from features)

- `y_test/train` -> activity represented by number.

- `test/train_data` -> binds all test/train files (columns side by side)

5. Merge `test_data` and `train_data` with `rbind ()`

### 2 - Extracts only the measurements on the mean and standard deviation for each
### measurement.

6. [select] columns that contains the mean or std keywords.

### 3 - Uses descriptive activity names to name the activities in the data set

7. Swap the numbers to names (on activity column) using `activity_label`.

### 4 - Appropriately labels the data set with descriptive variable names. 

Replaces certain abreviations on (Columns) `names ()` using `gsub ()`

- `Acc` to  `Accelerometer`

- `Gyro` to `Gyroscope`

- `^t` to `Time` (note: regex with `^` means the start of the string)

- `^f` to `Frequency`

- `Mag` to `Magnitude`

### 5 - From the data set in step 4, creates a second, independent tidy data set 
###     with the average of each variable for each activity and each subject.

1. Creates a new data set with `group_by` and `summarize_all`, functions that we used
on Swirl (but i forgot that existed lol)

2. Returns to the original folder

3. write the txt file according to the submission criteria. 