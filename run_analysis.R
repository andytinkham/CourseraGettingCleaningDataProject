# Johns Hopkins University Coursera Data Science Specialization
# Getting and Cleaning Data course, final project
# Andy Tinkham, April 8, 2018

library(data.table)

# Retrieve the data if it doesn't already exist in the working directory
if (!file.exists("./UCIHARDataSet.zip")) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile = "./UCIHARDataSet.zip",
                      method = "curl")

        # Unzip the data. Overwrite any files that might already exist with the
        # same names to make sure the data we downloaded remains consistent
        unzip("./UCIHARDataSet.zip", overwrite = TRUE)
}

# Read in the following files:
# ./UCI HAR Dataset/activity_labels.txt
# ./UCI HAR Dataset/features.txt
# ./UCI HAR Dataset/test/subject_test.txt
# ./UCI HAR Dataset/test/X_test.txt
# ./UCI HAR Dataset/test/y_test.txt
# ./UCI HAR Dataset/train/subject_train.txt
# ./UCI HAR Dataset/train/X_train.txt
# ./UCI HAR Dataset/train/y_train.txt

setwd("./UCI HAR Dataset")

# Overall descriptors
activity_labels <- read.table("./activity_labels.txt", sep = " ",
                              col.names = c("activityid", "activitydescription"))

features <- read.table("./features.txt",
                       col.names = c("featureid", "measurementname"))

# Test data set
subject_test <-  read.table("./test/subject_test.txt", col.names = "subjectid")

X_test <- read.table("./test/X_test.txt")

y_test <- read.table("./test/y_test.txt", col.names = "activityid")

testdataset <- data.table(subject_test, X_test, y_test)

# Training data set
subject_train <- read.table("./train/subject_train.txt", col.names = "subjectid")

X_train <- read.table("./train/X_train.txt")

y_train <- read.table("./train/y_train.txt", col.names = "activityid")

traindataset <- data.table(subject_train, X_train, y_train)

setwd("..")

# Merge the training and test sets into one data set
dataset <- rbind(traindataset, testdataset)

# Extract only the measurements on the mean and standard deviation for each
# measurement

# Use descriptive activity names to name the activities in the data set

# Appropriately label the data set with descriptive variable names

# Create a 2nd independent tidy data set with the average of each variable for
# each activity and each subject

# Output the data set

# Write tidy data set to text file with write.table using row.name = FALSE
