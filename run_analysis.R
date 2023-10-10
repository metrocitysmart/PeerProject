# defining functions for reading data and combining train and test data
readFile <- function(path, filename, classes) {
  read.table(paste0(path, filename), header = FALSE, colClasses = classes)
}

combineTrainTest <- function(trainPath, testPath, trainFile, testFile,
                             classes) {
    train_data <- readFile(trainPath, trainFile, classes)
    test_data <- readFile(testPath, testFile, classes)
    data <- rbind(train_data, test_data)
}

# defining path variables
path <- "UCI HAR Dataset/"
path_test <- "UCI HAR Dataset/test/"
path_train <- "UCI HAR Dataset/train/"

# reading the column headers from the features.txt file
features <- readFile(path, "features.txt", c("NULL", "character"))
features <- features$V2

# reading and train and test sets and merging them as one dataset
X <- combineTrainTest(path_train, path_test, "X_train.txt", "X_test.txt",
                      "numeric")
colnames(X) <- features

# reading the activities train and test sets and merging them as one dataset
y <- combineTrainTest(path_train, path_test, "y_train.txt", "y_test.txt",
                      "character")
y <- y$V1

# labeling the activities
act <- readFile(path, "activity_labels.txt", c("NULL", "character"))
su_y <- sort(unique(y))
for(i in 1:length(unique(y))) {
  y[y==su_y[i]] <- act$V2[i]
}

# reading the subject train and test sets and merging them as one dataset
subject <- combineTrainTest(path_train, path_test, "subject_train.txt",
                            "subject_test.txt", "integer")

# extracting the measurements on mean and standard deviations
cols <- setdiff(grep("mean|std", features, value = TRUE),
                grep("meanFreq", features, value = TRUE))


df <- cbind(subject = subject$V1, activity = y, X[,cols])
library(dplyr)
averages_df <- df %>%
  group_by(subject, activity) %>%
  summarize(across(everything(), mean))
averages_df