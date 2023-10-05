### work done
First the path to work directory was set. The path variables for train and test
directories and also for the "Inertial Signals" folder in each of these folders were assigned.  
Written two functions **get_table** and **combineTrainTest**. The
get_table function reads data when provided the path to a file and the file
name. The combineTrainTest function uses get_table function to read train data
and test data and combines them both into a single data set.  
Used the above two functions to obtain _subjects_, _activities_, _features_,
_body_acc_x_, _body_acc_y_, _body_acc_z_, _body_gyro_x_, _body_gyro_y_, 
_body_gyro_z_, _total_acc_x_, _total_acc_y_ and _total_acc_z_ datasets from
their corresponding train and test data.  
The activities are integer coded hence written **con_activity** function to
convert the integer codes to character labels after reading the
**activity_labels.txt** file and assigning appropriate labels to activities and
generating a _activity_ vector.  
The **get_ExtractionIndexes** function extracts the indexes of the measurements
of mean and standard deviations from the **features.txt** file, when provided
with the path along with the filename. The **extraction_file** variable stores
the path and file name of the _features.txt_ file. The **extract_ind** variable
stores the extracted indexes corresponding to the mean and standard deviation
measurements.  
Except for _activities_ and _subjects_ datasets all the remaining datasets store
numeric data in text or character format. Defined four functions
**getMatrixRow**, **define_matrix**, **fill_matrix** and **get_Matrix**. The _define_matrix_ functions defines a specified number of rows and columns' matrix filled with NAs. The _fill_matrix_ function uses a for loop to initialize the 
NAs matrix with data by calling _getMatrixRow_ function, which reads a row of
the character format data, splits them up, drops non-numeric parts and converts the rest to a vector of numeric data. The **colNames** and **signal_colNames** generates column names for the features and signals matrices, respectively.
Finally the _get_Matrix_ function calls the _define_matrix_ and _fill_matrix_
functions and returns a matrix of data values.  
After generating matrices for features and the nine signals data, the final
complete data frame, **humanActvtyData** is generated from all the vectors and matrices and saved as **finalDataset.txt**
The extracted indexes of mean and standard deviation measurements are used to
generate column headings to subset from _humanActvtyData_ and corresponding data
from _humanActvtyData_ extracted.  
Finally a new tidy-format data set _hmnAct_subActvty_ data set is generated by grouping _humanActvtyData_ by subject and activity and summarizing by taking
mean of all the remaining variables.
_humanActvtyData_ is returned.