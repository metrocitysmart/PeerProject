# initialize the path variables for train and test data
path1 <- "UCI HAR Dataset/train/"
path2 <- "UCI HAR Dataset/test/"
path3 <- "UCI HAR Dataset/train/Inertial Signals/"
path4 <- "UCI HAR Dataset/test/Inertial Signals/"

# a function to read a file at a given path
get_table <- function(aPath, aFile) {
    atable <- read.table(paste0(aPath, aFile), header = FALSE, sep = ",")
}

# a function to read the train and test data and combine them into a single
# data frame
combineTrainTest <- function(trainPath, testPath, trainFile, testFile) {
    train_set <- get_table(trainPath, trainFile)
    test_set <- get_table(testPath, testFile)
    rbind(train_set, test_set)
}

# reading and combining features data
features <- combineTrainTest(path1, path2, "X_train.txt", "X_test.txt")

# reading and combining activities data
activities <- combineTrainTest(path1, path2, "Y_train.txt", "Y_test.txt")

# reading and combining subjects data
subjects <- combineTrainTest(path1, path2, "subject_train.txt",
                             "subject_test.txt")

# reading and combining body acceleration signals
body_acc_x <- combineTrainTest(path3, path4,
                               "body_acc_x_train.txt", "body_acc_x_test.txt")
body_acc_y <- combineTrainTest(path3, path4,
                               "body_acc_y_train.txt", "body_acc_y_test.txt")
body_acc_z <- combineTrainTest(path3, path4,
                               "body_acc_z_train.txt", "body_acc_z_test.txt")

# reading and combining data for body gyro signals
body_gyro_x <- combineTrainTest(path3, path4,
                                "body_gyro_x_train.txt", "body_gyro_x_test.txt")
body_gyro_y <- combineTrainTest(path3, path4,
                                "body_gyro_y_train.txt", "body_gyro_y_test.txt")
body_gyro_z <- combineTrainTest(path3, path4,
                                "body_gyro_z_train.txt", "body_gyro_z_test.txt")

# reading and combining total acceleration signals
total_acc_x <- combineTrainTest(path3, path4,
                                "total_acc_x_train.txt", "total_acc_x_test.txt")
total_acc_y <- combineTrainTest(path3, path4,
                                "total_acc_y_train.txt", "total_acc_y_test.txt")
total_acc_z <- combineTrainTest(path3, path4,
                                "total_acc_z_train.txt", "total_acc_z_test.txt")

activity_file <- "UCI HAR Dataset/activity_labels.txt"
# a function that labels the activities in the data set provided
conv_activity <- function(x){
  actvty <- read.table(activity_file, colClasses = c("integer", "character"))
  x <- as.character(unlist(x))
  x[x=="1"] <- actvty$V2[1]
  x[x=="2"] <- actvty$V2[2]
  x[x=="3"] <- actvty$V2[3]
  x[x=="4"] <- actvty$V2[4]
  x[x=="5"] <- actvty$V2[5]
  x[x=="6"] <- actvty$V2[6]
  x
}

# labeling each activity appropriately and generating vector of activities
activity <- conv_activity(activities)

# a function to extract the indexes of the features that represent the
# measurement of mean and standard deviations, from "features.txt" file
get_ExtractionIndexes <- function(filename){
  headers <- read.table(filename, header = FALSE, 
                        colClasses = c("NULL", "character"))
  extraction_index <- setdiff(grep("mean|std", headers$V2),
                              grep("meanFreq", headers$V2))
}

# variable storing the path to "features.txt" file
extraction_file <- "UCI HAR Dataset/features.txt"

# extracting the actual indexes from the "features.txt" file
extract_ind <- get_ExtractionIndexes(extraction_file)

# a function to read in a row of character data and convert to numeric format
# and return a row of numeric data
getMatrixRow <- function(x){
  arow <- unlist(strsplit(x, " "))
  row_index <- sapply(arow, function(y) y!="")
  as.numeric(arow[row_index])
}

# column name vectors for features data and signals data
colNames <- paste0("FTR", 1:561)
signal_colNames <- paste0("S", 1:128)

# a function that defines matrix of a particular size with NAs.
define_matrix <- function(aDataFrame, column_names) {
    aMat <- matrix(nrow = length(aDataFrame$V1), ncol = length(column_names),
           dimnames = list(NULL, column_names))
}

# a function that fills the NAs matrix with data and returns the matrix
fill_matrix <- function(aMatrix, aDataframe) {
  for(i in 1:nrow(aMatrix)){
    aMatrix[i,] <- getMatrixRow(aDataframe[i,])
  }
  aMatrix
}

# a function that combines defining and assigning the matrix to data values
get_Matrix <- function(Adataframe, columnNamesVector) {
    aMat <- define_matrix(Adataframe, columnNamesVector)
    aMat <- fill_matrix(aMat, Adataframe)
}

# converting the individual features data frames and signals data frames into
# matrices for conversion to final data frame.
featureMatrix <- get_Matrix(features, colNames)
mat_bodyAccX <- get_Matrix(body_acc_x, signal_colNames)
mat_bodyAccy <- get_Matrix(body_acc_y, signal_colNames)
mat_bodyAccz <- get_Matrix(body_acc_z, signal_colNames)
mat_bodyGyroX <- get_Matrix(body_gyro_x, signal_colNames)
mat_bodyGyroy <- get_Matrix(body_gyro_y, signal_colNames)
mat_bodyGyroz <- get_Matrix(body_gyro_z, signal_colNames)
mat_totalAccX <- get_Matrix(total_acc_x, signal_colNames)
mat_totalAccY <- get_Matrix(total_acc_y, signal_colNames)
mat_totalAccZ <- get_Matrix(total_acc_z, signal_colNames)

# creating the final data frame from all the data above in tidy format
humanActvtyData <- data.frame(
           sub=subjects$V1,
           act=activity,
           feat=featureMatrix,
           bodyAccX=mat_bodyAccX,
           bodyAccY=mat_bodyAccy,
           bodyAccZ=mat_bodyAccz,
           bodyGyX=mat_bodyGyroX,
           bodyGyY=mat_bodyGyroy,
           bodyGyZ=mat_bodyGyroz,
           totAccX=mat_totalAccX,
           totAccY=mat_totalAccY,
           totAccZ=mat_totalAccZ
           )

# column names of measurements corresponding the mean and standard deviation
# measurements
extraction_colNames <- paste0("feat.FTR", extract_ind)

# fetching mean and standard deviation data from the complete data frame
humanActvtyData[, extraction_colNames]

# generating an independent tidy-format data frame from complete data frame
# grouped by subject and activity and summarizing rest of the data
library(dplyr)
hmnAct_subActvty <- humanActvtyData %>%
  group_by(sub, act) %>%
  summarize(across(everything(), mean))
write.table(hmnAct_subActvty, "finalDataset.txt", row.name = FALSE)
hmnAct_subActvty