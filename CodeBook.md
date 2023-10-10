---
title: "Coursera Getting and Cleaning data Peer Project"
---

### Final Data frame description
There are 68 variables in the tidy-format data set, generated from this
project. 

|         Variable            |                Description                   |
|-----------------------------|----------------------------------------------|
|    *subject*                | integer type data, represents                |
|                             | subject id which ranges from 1-30.           |
|                             |                                              |
|    *activity*               | character type data, represents activity     |
|                             | description,each subject carried out.        |   
|                             | The values are WALKING, WALKING_UPSTAIRS,    | 
|                             | WALKING_DOWNSTAIRS, STANDING, SITTING and    |
|                             | LAYING.                                      |
|                             |                                              |
|                             | _all variables are numeric type data_        |
| tBodyAcc-mean()-X           | The variables correspond to the measurements |
| tBodyAcc-mean()-Y           | on mean and standard deviations, taken from  |
| tBodyAcc-mean()-Z           | **features.txt** file                        |
| tBodyAcc-std()-X            |                                              |
| tBodyAcc-std()-Y            |                                              |
| tBodyAcc-std()-Z            |                                              |
| tGravityAcc-mean()-X        |                                              |
| tGravityAcc-mean()-Y        |                                              |
| tGravityAcc-mean()-Z        |                                              |
| tGravityAcc-std()-X         |                                              |
| tGravityAcc-std()-Y         |                                              |
| tGravityAcc-std()-Z         |                                              |
| tBodyAccJerk-mean()-X       |                                              |
| tBodyAccJerk-mean()-Y       |                                              |
| tBodyAccJerk-mean()-Z       |                                              |
| tBodyAccJerk-std()-X        |                                              |
| tBodyAccJerk-std()-Y        |                                              |
| tBodyAccJerk-std()-Z        |                                              |
| tBodyGyro-mean()-X          |                                              |
| tBodyGyro-mean()-Y          |                                              |
| tBodyGyro-mean()-Z          |                                              |
| tBodyGyro-std()-X           |                                              |
| tBodyGyro-std()-Y           |                                              |
| tBodyGyro-std()-Z           |                                              |
| tBodyGyroJerk-mean()-X      |                                              |
| tBodyGyroJerk-mean()-Y      |                                              |
| tBodyGyroJerk-mean()-Z      |                                              |
| tBodyGyroJerk-std()-X       |                                              |
| tBodyGyroJerk-std()-Y       |                                              |
| tBodyGyroJerk-std()-Z       |                                              |
| tBodyAccMag-mean()          |                                              |
| tBodyAccMag-std()           |                                              |
| tGravityAccMag-mean()       |                                              |
| tGravityAccMag-std()        |                                              |
| tBodyAccJerkMag-mean()      |                                              |
| tBodyAccJerkMag-std()       |                                              |
| tBodyGyroMag-mean()         |                                              |
| tBodyGyroMag-std()          |                                              |
| tBodyGyroJerkMag-mean()     |                                              |
| tBodyGyroJerkMag-std()      |                                              |
| fBodyAcc-mean()-X           |                                              |
| fBodyAcc-mean()-Y           |                                              |
| fBodyAcc-mean()-Z           |                                              |
| fBodyAcc-std()-X            |                                              |
| fBodyAcc-std()-Y            |                                              |
| fBodyAcc-std()-Z            |                                              |
| fBodyAccJerk-mean()-X       |                                              |
| fBodyAccJerk-mean()-Y       |                                              |
| fBodyAccJerk-mean()-Z       |                                              |
| fBodyAccJerk-std()-X        |                                              |
| fBodyAccJerk-std()-Y        |                                              |
| fBodyAccJerk-std()-Z        |                                              |
| fBodyGyro-mean()-X          |                                              |
| fBodyGyro-mean()-Y          |                                              |
| fBodyGyro-mean()-Z          |                                              |
| fBodyGyro-std()-X           |                                              |
| fBodyGyro-std()-Y           |                                              |
| fBodyGyro-std()-Z           |                                              |
| fBodyAccMag-mean()          |                                              |
| fBodyAccMag-std()           |                                              |
| fBodyBodyAccJerkMag-mean()  |                                              |
| fBodyBodyAccJerkMag-std()   |                                              |
| fBodyBodyGyroMag-mean()     |                                              |
| fBodyBodyGyroMag-std()      |                                              |
| fBodyBodyGyroJerkMag-mean() |                                              |
| fBodyBodyGyroJerkMag-std()  |                                              |

The units for body acceleration values and total acceleration values is 'g'  
The unit for body angular velocity values is radians/sec.  

Downloaded the data from the [link]
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

on to my computer, extracted the data to my projects folder and then used
the files for this project. The **UCI HAR Datasets** folder contains the
**activity_labels.txt**, **features.txt**, **features_info.txt**, **README.txt**
files and **train** and **test** folders.  
The _train_ folders contain the files **X_train.txt**, **y_train.txt**, **subject_train.txt** and the **Inertial Signals** folder. The _test_ folder
contains the files **X_test.txt**, **y_test.txt**, **subject_test.txt** and
**Inertial Signals** folder.  

### work done
Written two functions **readFile** and **combineTrainTest**.
The *readFile* function reads in data by taking the arguments for path to a file, 
the file name and a **classes** argument that takes the value for the
**colClasses** argument for the *read.table* function.  
The **combineTrainTest** function uses the _readFile_ function to read train
data and test data and combine them both into a single data set.   
Defined the path variables for _UCI HAR Datasets_ folder and also for _train_
and _test_ folders within the above folder.  
Read the contents of the _features.txt_ file into *features* variable. After
reading the data converted the data frame into a character vector.  
Read the contents of **X_train.txt** and **X_test.txt** and combined them into
a single dataset **X**. Assigned the _features_ vector as the column names to
the _X_ data set.  
Read the contents of **y_train.txt** and **y_test.txt** files and combined them
to a single data set **y**. The _y_ data set represents activities coded as
integers. Read the **activity_labels.txt** file and assigned a label to each
activity using a for loop.
Read the **subject_train.txt** and **subject_test.txt** files from their
respective _train_ and _test_ folders and combined them into a single data set
**subject**.  
Extracted the variables which correspond to the measurements of mean and
standard deviations from _features_ as another character vector.  
Defined a data frame **df** from _subject_, _y_ and _X_ data sets with _X_
subset with the extracted variables. Finally defined another data set
**df_averages** after grouping by subject and activities and taking the mean of
all the other numeric columns.  
Written the data set values to a text file and returned the final data set.