This repo contains three files  
- run_analysis.R  
- CodeBook.md and  
- README.md, this readme file  

The _run_analysis.R_ file generates a data set of mean values of measurements
of mean and standard deviations after grouping by subject and activities.  
The _CodeBook.md_ describes the data frame, the variables, the data values and
work done to obtain the data frame.
The above two files and this _README.md_ file reside in the **PeerProject**
repo.


### work done in run_analysis.R file  
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