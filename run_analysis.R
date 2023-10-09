# reading the column headers from the features.txt file
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE,
                       colClasses = c("NULL", "character"))
features <- features$V2

path_test <- "UCI HAR Dataset/test/"
path_train <- "UCI HAR Dataset/train/"

readFile <- function(path, filename, classes) {
    read.table(paste0(path, filename), header = FALSE, colClasses = classes)
}

# reading and train and test sets and merging them as one dataset
x_train <- readFile(path_train, "X_train.txt", "numeric")
x_test <- readFile(path_test, "X_test.txt", "numeric")
X <- rbind(x_train, x_test)
colnames(X) <- features

# reading the activities train and test sets and merging them as one dataset
y_train <- readFile(path_train, "y_train.txt", "character")
y_test <- readFile(path_test, "y_test.txt", "character")
y <- rbind(y_train, y_test)
y <- y$V1

# labeling the activities
act <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE,
               colClasses = c("NULL", "character"))
y[y=="1"] <- act$V2[1]
y[y=="2"] <- act$V2[2]
y[y=="3"] <- act$V2[3]
y[y=="4"] <- act$V2[4]
y[y=="5"] <- act$V2[5]
y[y=="6"] <- act$V2[6]



# reading the subject train and test sets and merging them as one dataset
subject_train <- readFile(path_train, "subject_train.txt", "integer")
subject_test <- readFile(path_test, "subject_test.txt", "integer")
subject <- rbind(subject_train, subject_test)
rm(x_test, x_train, y_test, y_train, subject_test, subject_train)

# extracting the measurements on mean and standard deviations
cols <- setdiff(grep("mean|std", features, value = TRUE),
                grep("meanFreq", features, value = TRUE))

df <- cbind(subject = subject$V1, activity = y, X[,cols])
library(dplyr)
averages_df <- df %>%
  group_by(subject, activity) %>%
  summarize(across(everything(), mean))
